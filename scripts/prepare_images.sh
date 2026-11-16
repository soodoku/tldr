#!/usr/bin/env bash

set -euo pipefail

max_edge="${IMAGE_MAX_EDGE:-2400}"
jpeg_quality="${IMAGE_JPEG_QUALITY:-85}"
mode="fix"

if [[ "${1:-}" == "--check" ]]; then
  mode="check"
  shift
elif [[ "${1:-}" == "--fix" ]]; then
  shift
fi

if ! command -v exiftool >/dev/null 2>&1; then
  echo "exiftool is required" >&2
  exit 2
fi

if [[ ! "$max_edge" =~ ^[0-9]+$ ]] || [[ ! "$jpeg_quality" =~ ^[0-9]+$ ]]; then
  echo "IMAGE_MAX_EDGE and IMAGE_JPEG_QUALITY must be integers" >&2
  exit 2
fi

list_images() {
  if [[ "$#" -gt 0 ]]; then
    printf '%s\0' "$@"
  else
    git ls-files -z -- src
  fi
}

has_metadata() {
  [[ -n "$(exiftool -q -q -s -EXIF:all -XMP:all -IPTC:all "$1")" ]]
}

is_jpeg() {
  case "$1" in
    *.jpg | *.jpeg | *.JPG | *.JPEG) return 0 ;;
    *) return 1 ;;
  esac
}

is_supported_image() {
  case "$1" in
    *.jpg | *.jpeg | *.JPG | *.JPEG | *.png | *.PNG | *.webp | *.WEBP | \
      *.gif | *.GIF | *.tif | *.tiff | *.TIF | *.TIFF) return 0 ;;
    *) return 1 ;;
  esac
}

image_dimensions() {
  exiftool -q -q -s3 -ImageWidth -ImageHeight "$1" | tr '\n' ' '
}

resize_jpeg() {
  local image="$1"
  local temporary

  if ! command -v magick >/dev/null 2>&1; then
    echo "ImageMagick is required to resize JPEG files" >&2
    exit 2
  fi

  temporary="$(mktemp "${TMPDIR:-/tmp}/prepare-images.XXXXXX")"
  magick "$image" \
    -auto-orient \
    -resize "${max_edge}x${max_edge}>" \
    -strip \
    -colorspace sRGB \
    -sampling-factor 4:4:4 \
    -quality "$jpeg_quality" \
    "jpg:$temporary"
  mv "$temporary" "$image"
}

strip_metadata() {
  exiftool \
    -q \
    -overwrite_original \
    -all= \
    -tagsfromfile @ \
    -icc_profile \
    "$1"
}

checked=0
changed=0
violations=0

while IFS= read -r -d '' image; do
  is_supported_image "$image" || continue
  [[ -f "$image" ]] || continue

  checked=$((checked + 1))
  metadata=false
  oversized=false

  if has_metadata "$image"; then
    metadata=true
  fi

  if is_jpeg "$image"; then
    read -r width height <<<"$(image_dimensions "$image")"
    if [[ "$width" =~ ^[0-9]+$ ]] && [[ "$height" =~ ^[0-9]+$ ]] && \
      ((width > max_edge || height > max_edge)); then
      oversized=true
    fi
  fi

  if [[ "$mode" == "check" ]]; then
    if [[ "$metadata" == true ]]; then
      echo "metadata: $image"
      violations=$((violations + 1))
    fi
    if [[ "$oversized" == true ]]; then
      echo "oversized JPEG: $image"
      violations=$((violations + 1))
    fi
    continue
  fi

  if [[ "$oversized" == true ]]; then
    resize_jpeg "$image"
    echo "resized and stripped: $image"
    changed=$((changed + 1))
  elif [[ "$metadata" == true ]]; then
    strip_metadata "$image"
    echo "stripped: $image"
    changed=$((changed + 1))
  fi
done < <(list_images "$@")

if [[ "$mode" == "check" ]]; then
  if ((violations > 0)); then
    echo "$violations image policy violations across $checked files" >&2
    exit 1
  fi
  echo "$checked images pass"
else
  echo "$changed of $checked images updated"
fi

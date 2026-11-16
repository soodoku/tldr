#!/usr/bin/env bash
# Write a starter summary that embeds every image in src/<slug>/, in name order.
# Usage: scripts/generate_image_gallery.sh <slug> "<Title>"
# e.g.   scripts/generate_image_gallery.sh 59_honeysett_microphobia "Microphobia"

set -euo pipefail

if [[ "$#" -ne 2 ]]; then
  echo "Usage: $0 <slug> <title>" >&2
  exit 2
fi

slug="$1"
title="$2"
image_dir="src/$slug"
output_file="summaries/$slug.md"

if [[ ! -d "$image_dir" ]]; then
  echo "No such directory: $image_dir" >&2
  exit 1
fi
if [[ -e "$output_file" ]]; then
  echo "Refusing to overwrite $output_file" >&2
  exit 1
fi

{
  echo "## $title"
  echo
  for file in "$image_dir"/*; do
    [[ -f "$file" ]] || continue
    case "$file" in
      *.jpg | *.png | *.gif | *.webp) ;;
      *) continue ;;
    esac
    echo "<img src=\"../$file\" width=\"500\">"
  done
} >"$output_file"

echo "Wrote $output_file"

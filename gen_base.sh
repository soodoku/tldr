#!/bin/bash

# Directory containing the images
IMAGE_DIR="src/microphobia"

# Output HTML file
OUTPUT_FILE="summaries/59_microphobia.md"

# Check if the directory is provided and exists
if [ -z "$IMAGE_DIR" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

if [ ! -d "$IMAGE_DIR" ]; then
  echo "Error: Directory $IMAGE_DIR does not exist."
  exit 1
fi

# Start the Markdown file
echo "# Image Links" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Loop through the files and create Markdown image links
for FILE in "$IMAGE_DIR"/*; do
  if [ -f "$FILE" ]; then
    FILENAME=$(basename "$FILE")
    echo "<img src=\"$FILENAME\" width=\"350\">" >> "$OUTPUT_FILE"
  fi
done

echo "Markdown file generated: $OUTPUT_FILE"
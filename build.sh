#!/usr/bin/env bash
set -e

# check for fzf
if ! command -v fzf &>/dev/null; then
  echo "fzf is required — install it with: brew install fzf"
  exit 1
fi

# check for typst
if ! command -v typst &>/dev/null; then
  echo "typst is required — install it with: brew install typst"
  exit 1
fi

# step 1: pick a template
template=$(find template -name "*.typ" | fzf --prompt="Select template: " --height=10 --border)
[ -z "$template" ] && exit 0

# step 2: pick content
content=$(find content -name "*.yaml" | fzf --prompt="Select content: " --height=10 --border)
[ -z "$content" ] && exit 0

# derive output filename from content file
output="$(basename "$content" .yaml).pdf"

echo "Compiling → $output"
typst compile resume.typ "$output" --font-path fonts/ --input content="$content"
echo "Done: $output"

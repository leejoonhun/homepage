#!/bin/bash

TARGET_FILE="resume.html"

if ! git diff --cached --name-only --diff-filter=ACM | grep -q "^$TARGET_FILE$"; then
  exit 0
fi

if [ ! -f "$TARGET_FILE" ]; then
  exit 0
fi

ordinal_suffix() {
  day=$1
  case $day in
    1|21|31) echo "st" ;;
    2|22)    echo "nd" ;;
    3|23)    echo "rd" ;;
    *)       echo "th" ;;
  esac
}

day=$(date +%-d)
suffix=$(ordinal_suffix $day)
month=$(date +%B)
year=$(date +%Y)

UPDATED_DATE="$month ${day}${suffix}, $year"

tmpfile=$(mktemp)
total_lines=$(wc -l < "$TARGET_FILE")
head -n $((total_lines-3)) "$TARGET_FILE" > "$tmpfile"
echo "    <footer class=\"footer\">Last updated on $UPDATED_DATE</footer>" >> "$tmpfile"
tail -n 2 "$TARGET_FILE" >> "$tmpfile"

mv "$tmpfile" "$TARGET_FILE"

git add "$TARGET_FILE"

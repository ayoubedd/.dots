function note() {
  local NAME="$1"
  local FILE_PATH=$(find "$NOTES_PATH" -type f -iname "$NAME*.md")
  if [ -f "$FILE_PATH" ]; then
    $EDITOR "$FILE_PATH"
  else
    echo 'target file not found!'
    return 1
  fi
}

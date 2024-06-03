function note() {
  local NAME="$1"
  local FILE_PATH=$(find "$NOTES_PATH" -type f -iname "$NAME*.md")
  if [ -f "$FILE_PATH" ]; then
    xdg-open "$FILE_PATH"
  else
    echo 'target file not found!'
    return 1
  fi
}

function man() {
	env \
		LESS_TERMCAP_md=$(tput bold; tput setaf 4) \
		LESS_TERMCAP_me=$(tput sgr0) \
		LESS_TERMCAP_mb=$(tput blink) \
		LESS_TERMCAP_us=$(tput setaf 2) \
		LESS_TERMCAP_ue=$(tput sgr0) \
		LESS_TERMCAP_so=$(tput smso) \
		LESS_TERMCAP_se=$(tput rmso) \
		PAGER="${commands[less]:-$PAGER}" \
		man "$@"
}


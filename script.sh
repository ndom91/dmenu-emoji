#!/bin/bash

set -e

case "$1" in
  "list")
    data=$(sed '0,/^__DATA__$/d' "$0")
    echo "$data"
    ;;
  "copy")
    input=$(tee)
    if [ ! -z "$input" ]; then
      emoji=${input: -1}
      echo -n "$emoji" | xclip -selection c
    fi
    ;;
  "")
    bash $0 list | dmenu -i -nb '#292d3e' -nf '#bbc5ff' -sb '#ff79c6'  -sf '#292d3e' -fn 'FiraMono Nerd Font-12' -p 'Emoji: ' | bash $0 copy
    ;;
esac

exit

__DATA__

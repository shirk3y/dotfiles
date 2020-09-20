#!/bin/sh

REMOTE=${REMOTE:-https://github.com/shirk3y/dotfiles.git}
DEST=${DEST:-$HOME/.dotfiles}


git clone --depth=1 "$REMOTE" "$DEST"
cd "$DEST"

sh "$DEST/wsl2-alpine/setup.sh"

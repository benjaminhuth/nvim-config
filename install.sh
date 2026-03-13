#!/bin/bash

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

if [ -n "$XDG_CONFIG_HOME" ]; then
    echo "Using XDG_CONFIG_HOME: $XDG_CONFIG_HOME"
else
    echo "XDG_CONFIG_HOME not set, using default: $CONFIG_DIR"
fi

read -p "Continue? (y/n) " -n 1 -r
echo    # Move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Installation cancelled."
    exit 1
fi

rm -fr "$CONFIG_DIR/nvim"
cp -fr config/nvim "$CONFIG_DIR/nvim"

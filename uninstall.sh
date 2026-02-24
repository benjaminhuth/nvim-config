#!/bin/bash

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}"
STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}"

echo "The following directories will be removed:"
echo "  Config: $CONFIG_DIR/nvim"
echo "  Data:   $DATA_DIR/nvim"
echo "  State:  $STATE_DIR/nvim"
echo ""

# Ask for confirmation to delete
read -p "Are you sure you want to uninstall all neovim configuration files? (y/n) " -n 1 -r
echo    # Move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Uninstallation cancelled."
    exit 1
fi

rm -vfr "$CONFIG_DIR/nvim"
rm -vfr "$DATA_DIR/nvim"
rm -vfr "$STATE_DIR/nvim"

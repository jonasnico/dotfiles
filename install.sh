#!/bin/bash

# Backup existing dotfiles
backup_dir=~/dotfiles_backup_$(date +%Y%m%d_%H%M%S)
mkdir -p "$backup_dir"

# Function to backup and link
link_dotfile() {
    local file=$1
    if [ -f ~/$file ] || [ -L ~/$file ]; then
        echo "Backing up existing $file to $backup_dir"
        mv ~/$file "$backup_dir/"
    fi
    echo "Creating symlink for $file"
    ln -s ~/dotfiles/$file ~/$file
}

# Link dotfiles
link_dotfile .zshrc

echo "Installation complete! Backup saved to $backup_dir"
echo "Restart your shell or run: source ~/.zshrc"

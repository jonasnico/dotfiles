#!/bin/bash

# Backup existing files and link
backup_dir=~/dotfiles_backup_$(date +%Y%m%d_%H%M%S)
mkdir -p "$backup_dir"

link_dotfile() {
    local file=$1
    if [ -f ~/$file ] || [ -L ~/$file ]; then
        echo "Backing up existing $file to $backup_dir"
        mv ~/$file "$backup_dir/"
    fi
    echo "Creating symlink for $file"
    ln -s ~/dotfiles/$file ~/$file
}

link_dotfile .zshrc
link_dotfile .gitconfig

echo "Installation complete! Backup saved to $backup_dir"
echo ""
echo "NOTE: Don't forget to:"
echo "  - Customize .gitconfig: Add actual values for email and GPG key (or remove if not using GPG)"
echo "  - Create ~/.zsh_private for work-specific aliases and secrets (this file is not tracked in git)"
echo ""
echo "Restart your shell or run: source ~/.zshrc"

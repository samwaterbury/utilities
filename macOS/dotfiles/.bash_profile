#!/usr/bin/env bash

# Command aliases
alias ll="ls -lhAG"
alias la="ls -A"
alias vim="nvim"
alias diff="colordiff"
alias gs="git status"
alias top="top -o mem"
alias free="top -l 1 -s 0 | grep PhysMem"
alias less="less -r"
alias restart-gui="killall -KILL Dock"
alias weather="curl -s wttr.in | head -38"
alias quote="fortune | cowsay | lolcat"

# Path aliases
alias icloud="cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs"
alias projects="cd $HOME/Projects"
alias ~="cd $HOME"  # The extent of my laziness knows no bounds

# SSH server aliases
[ -f "$HOME/.secrets" ] || touch "$HOME/.secrets" && . "$HOME/.secrets"

# Silence message about zsh
export BASH_SILENCE_DEPRECATION_WARNING=1

# Exclude blank lines from bash history
export HISTCONTROL=ignorespace

# Set default editor
export VISUAL=nvim
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"

# Enable `ls` colors
export CLICOLOR=1
# export LSCOLORS=exfxcxdxbxegedabagacad # DEFAULT
export LSCOLORS=Exfxcxdxbxegedabagacad # BOLD DIRECTORIES

# Enable command prompt colors
# export PS1="\h:\W \u\$ " # DEFAULT
export PS1="\[\e[1;32m\]\u@macOS\[\e[m\]:\[\e[1;34m\]\W\[\e[m\]\$ " # GREEN-BLUE

# Rust language
export PATH="$HOME/.cargo/bin:$PATH"

# Bash completion for git
[ -r "/usr/local/etc/profile.d/bash_completion.sh" ] \
    && . "/usr/local/etc/profile.d/bash_completion.sh"

# Add Homebrew to the PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Alias this tool
eval "$(thefuck --alias)"

# Install Homebrew casks to ~/Applications instead of /Applications
export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"

# Make local sbin available for Homebrew packages requiring sudo
export PATH="/usr/local/sbin:$PATH"

# Add Python symlinks to the PATH
export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"

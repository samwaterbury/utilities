# Command aliases
alias ll="ls -lhAG"
alias la="ls -A"
alias diff="colordiff"
alias gs="git status"
alias top="top -o %MEM"
alias free="free -m"
alias less="less -r"
alias weather="curl -s wttr.in | head -38"
eval $(thefuck --alias)

# Path aliases
alias projects="cd $HOME/github"
alias ~="cd $HOME" # The extent of my laziness knows no bounds

# SSH server aliases
[ -f "$HOME/.secrets" ] || touch "$HOME/.secrets" && . "$HOME/.secrets"

# Exclude blank lines from bash history
export HISTCONTROL=ignorespace

# Set default editor
export VISUAL=vim
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"

# Enable colors
PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
eval "$(dircolors -b)"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# Rust language
export PATH="$HOME/.cargo/bin:$PATH"

# Miniconda
. "$HOME/miniconda3/etc/profile.d/conda.sh"

# Bash completion for git
. /etc/bash_completion.d/git-prompt

# Running rootless Docker requires these
export PATH="/home/sam/bin:$PATH"
export DOCKER_HOST="unix:///run/user/1000/docker.sock"

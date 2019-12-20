# Command aliases
alias ll="ls -lhAG"
alias la="ls -A"
alias diff="colordiff"
alias gs="git status"
alias top="top -o mem"
alias less="less -r"
alias weather="curl -s wttr.in | head -38"
alias nf="neofetch"
alias format-json="python -mjson.tool"
alias pause="kill -TSTP"
alias resume="kill -CONT"
eval "$(thefuck --alias)"

# Path aliases
alias icloud="cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs"
alias wd="cd $HOME/Documents/working-directory"
alias projects="cd $HOME/github"
alias ~="cd $HOME"  # The extent of my laziness knows no bounds

# SSH server aliases
. ~/.bash_secrets

# Exclude blank lines from bash history
export HISTCONTROL=ignorespace

# Set default editor
export VISUAL=vim
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"

# Enable `ls` colors
export CLICOLOR=1
# export LSCOLORS=exfxcxdxbxegedabagacad # DEFAULT
export LSCOLORS=Exfxcxdxbxegedabagacad # BOLD DIRECTORIES
# export LSCOLORS=Gxfxcxdxbxegedabagacad # CUSTOM

# Enable command prompt colors
# export PS1="\h:\W \u\$ " # DEFAULT
export PS1="\[\e[1;32m\]\u@macOS\[\e[m\]:\[\e[1;34m\]\W\[\e[m\]\$ " # GREEN-BLUE

# Install Homebrew casks to ~/Applications instead of /Applications
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

# Use Homebrew Ruby instead of the default system installation
export PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

# Make local sbin available for Homebrew packages requiring sudo
export PATH="/usr/local/sbin:$PATH"

# Miniconda needs to be initialized
if [ $(echo $PATH | grep /usr/local/sbin) ]; then
    . /usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh
else
    . /usr/local/miniconda3/etc/profile.d/conda.sh
fi

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
eval "$(thefuck --alias)"

# Path aliases
alias icloud="cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs"
alias wd="cd $HOME/Documents/working-directory"
alias projects="cd $HOME/github"
alias courses="cd $HOME/Documents/Courses"
alias ~="cd ~"  # The extent of my laziness knows no bounds

# SSH server aliases
. ~/.ssh_aliases

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

# Virtualenv helper function
activate () {
    source "$HOME/virtualenv/$1/bin/activate"
}

# Miniconda
. /usr/local/miniconda3/etc/profile.d/conda.sh

# Daily adage/fortune
alias fortune="fortune | cowsay | lolcat"
cutoff=$(date -v 6H -v 0M -v 0S +%s)
if [[ ( ! -f ~/.fortune ) \
  || ( `stat -f %m ~/.fortune` < $cutoff && $cutoff < `date +%s`) ]]; then
    fortune && touch ~/.fortune
fi

# Use Homebrew Ruby instead of the default system installation
export PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

# Make local sbin available for Homebrew packages requiring sudo
export PATH="/usr/local/sbin:$PATH"

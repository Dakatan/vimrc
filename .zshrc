export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="cobalt2"

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_MAGIC_FUNCTIONS=true
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

alias ll='ls -l'
alias gg='cd $(ghq root)/$(ghq list | peco)'
alias chkubectx='kubectx | peco | xargs kubectx'
alias chkubens='kubens | peco | xargs kubens'

export JAVA_HOME=`/usr/libexec/java_home`
export PATH="$HOME/.exenv/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export GOPATH=$HOME/Go
export PATH=$GOPATH/bin:$PATH

source ~/.cargo/env

export PATH=$HOME/.pyenv/shims:$PATH
export PATH=$HOME/.rbenv/shims:$PATH
export PATH=$HOME/.nodenv/shims:$PATH
export PATH=$HOME/.exenv/shims:$PATH

eval "$(pyenv init -)"
eval "$(rbenv init -)"
eval "$(nodenv init -)"
eval "$(exenv init -)"

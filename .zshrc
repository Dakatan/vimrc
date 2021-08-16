export ZSH="/Users/daisuke.takada.nd/.oh-my-zsh"
ZSH_THEME="cobalt2"
ZSH_DISABLE_COMPFIX=true

# ZSH_THEME_RANDOM_CANDIDATES=("robbyrussell" "agnoster")
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

alias gg='cd $(ghq root)/$(ghq list | peco)'
alias chkubectx='kubectx $(kubectx | peco)'
alias chkubens='kubens $(kubens | peco)'
alias tiller='/usr/local/opt/helm@2/bin/tiller'
alias helm2='/usr/local/opt/helm@2/bin/helm'
alias helm3='/usr/local/opt/helm/bin/helm'

source $HOME/.cargo/env

export PYENV_ROOT=$HOME/.pyenv
export HELM_HOME=$HOME/.helm
export JAVA_HOME=`/usr/libexec/java_home`
export GOPATH=$HOME/Go

export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH=$GOPATH/bin:$PATH
export PATH=${KREW_ROOT:-$HOME/.krew}/bin:$PATH
export PATH=$HOME/.exenv/bin:$PATH
export PATH=$HOME/.mix/escripts:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.rbenv/shims:$PATH
export PATH=$HOME/.nodenv/shims:$PATH
export PATH=$HOME/.pyenv/shims:$PATH
export PATH=$HOME/.exenv/shims:$PATH

eval "$(pyenv init -)"
eval "$(rbenv init -)"
eval "$(nodenv init -)"
eval "$(exenv init -)"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

bindkey -e
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history
setopt EXTENDED_HISTORY

alias l='ls -la'
alias ll='ls -l'
alias gg='cd $(ghq root)/$(ghq list | fzf --reverse)'
alias vv='vim $(find * -type f | fzf --reverse --preview "bat --color=always --style=header,grid --line-range :100 {}")'
alias cat='bat --style=plain --paging=never'
alias cc='echo $(find * -type f | fzf --reverse --preview "bat --color=always --style=header,grid --line-range :100 {}")'
alias tiller='/usr/local/opt/helm@2/bin/tiller'
alias vim='nvim'
alias vi='nvim'
alias helm2='/usr/local/opt/helm@2/bin/helm'
alias helm3='/usr/local/opt/helm/bin/helm'
alias tmux='tmux -u'
alias tt='tmux'
alias wip='git commit -m ":construction: WIP"'

export EDITOR=nvim
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

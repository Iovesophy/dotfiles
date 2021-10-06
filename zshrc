HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

source ~/.zsh/completion/git-prompt.sh
setopt PROMPT_SUBST
PS1='[🍢 %c$(__git_ps1 " (%s)")]\$ '

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}
zstyle ':completion:*:default' menu select=1

alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias g="git"
alias ls="exa"
alias lf="exa -d `find *`"
alias history="history 0"
export GOPATH=~/go
export PATH="$GOPATH/bin:$PATH"


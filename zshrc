source ~/.zsh/completion/git-prompt.sh
setopt PROMPT_SUBST
PS1='[%n@🍢 %c$(__git_ps1 " (%s)")]\$ '

fpath=(~/.zsh/completion $fpath)
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit -i
zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}
zstyle ':completion:*:default' menu select=1
complete -C '/usr/local/bin/aws_completer' aws
export PATH=/usr/local/bin/:$PATH

alias ls='ls -GF'
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias g="git"
alias history="history 0"

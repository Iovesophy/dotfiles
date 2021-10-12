source ~/.zsh/completion/git-prompt.sh
setopt PROMPT_SUBST
PS1='[%n@🍢 %c$(__git_ps1 " (%s)")]\$ '

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    rm -f ~/.zcompdump; compinit
    chmod -R go-w "$(brew --prefix)/share"
else
    source ~/.zsh/completion/aws_zsh_completer.sh
fi
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}
zstyle ':completion:*:default' menu select=1

alias ls='ls -GF'
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias g="git"
alias history="history 0"

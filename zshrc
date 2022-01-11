source ~/.zsh/completion/git-prompt.sh
setopt PROMPT_SUBST
PS1='%F{green}[%n %F{cyan}%c%F{red}$(__git_ps1 " %s")%F{green}]》%f'

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
else
    source ~/.zsh/completion/aws_zsh_completer.sh
fi

autoload -Uz compinit
rm -f ~/.zcompdump
compinit

zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}
zstyle ':completion:*:default' menu select=1

alias ls='ls -GF'
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

setopt auto_cd
alias dl="~/Downloads"
alias dt="~/Desktop"

setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
alias history="history 0"

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

source ~/.localzshrc

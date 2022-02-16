source ~/.zsh/completion/git-prompt.sh
setopt PROMPT_SUBST
PS1='%F{green}[%n %F{cyan}%c%F{red}$(__git_ps1 " %s")%F{green}]》%f'

FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
autoload -Uz compinit
rm -f ~/.zcompdump
compinit

zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}
zstyle ':completion:*:default' menu select=1

alias ls='ls -GF'
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export NODE_PATH="$(npm root -g)"

setopt auto_cd
alias dl="~/Downloads"
alias dt="~/Desktop"

setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
alias history="history 0"

# add widget
zle -N peco-select-history
function peco-select-history() {
    BUFFER=$(\history -n 1 | eval "tail -r" | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
bindkey '^r' peco-select-history

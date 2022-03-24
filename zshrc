source /usr/local/opt/zsh-git-prompt/zshrc.sh
setopt PROMPT_SUBST
PS1='%F{green}[%n %F{cyan}%c%F{black}$(git_super_status)%F{green}]》%f'

autoload -Uz compinit
rm -f ~/.zcompdump
compinit

zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}
zstyle ':completion:*:default' menu select=1

alias ls='ls -GF'
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

setopt auto_cd
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
alias history="history 0"

zle -N peco-select-history
function peco-select-history() {
  BUFFER=$(\history -n 1 | eval "tail -r" | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
bindkey '^r' peco-select-history


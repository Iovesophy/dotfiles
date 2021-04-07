source ~/.zsh/completion/git-prompt.sh

setopt PROMPT_SUBST
PS1='[%n@🍢 %c$(__git_ps1 " (%s)")]\$ '

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}

# ls
alias ls='ls -GF'
export CLICOLOR=1;
export LSCOLORS=gxfxcxdxbxegedabagacad;

# Shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias g="git"
alias history="history 0"

 # Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -" # you can input only - for ref cd hist

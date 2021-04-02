source ~/.zsh/completion/git-prompt.sh
setopt PROMPT_SUBST
PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

export ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="lines"
plugins=(git zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
source $HOME/.config/zsh/functions.zsh
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
setopt no_auto_remove_slash
eval "$(starship init zsh)"
#source $HOME/.config/zsh/themes/agkozak.zsh
#source $HOME/.config/zsh/themes/lines.zsh
#source $HOME/.config/zsh/themes/agnoster-gaps.zsh

autoload -Uz compinit promptinit colors
compinit
promptinit
colors

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory auto_cd auto_pushd correct complete_aliases complete_in_word extended_glob hist_ignore_dups interactive_comments pushd_ignore_dups transient_rprompt
setopt auto_list menu_complete bash_auto_list auto_menu list_ambiguous
unsetopt beep

bindkey -v
zstyle ':completion:*' completer _complete _ignored _match _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt %B%U%p%U%B
zstyle :compinstall filename '/home/josh/.zshrc'

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

source $HOME/.zprofile
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/git.zsh
#source $HOME/.config/zsh/prompt.zsh
source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source $HOME/.config/zsh/zsh-completions/zsh-completions.plugin.zsh
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"

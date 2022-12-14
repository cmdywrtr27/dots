export ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="bender2"
plugins=(git zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
export PATH="$HOME/.local/bin:$PATH"
export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=vim
export BROWSER=firefox
export MANPAGER='/bin/zsh -c "vim -Rn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist nornu nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
eval "$(starship init zsh)"
#source $HOME/.config/zsh/themes/agkozak/agkozak-zsh-prompt.plugin.zsh

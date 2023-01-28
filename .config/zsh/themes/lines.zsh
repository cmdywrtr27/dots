local return_code="%(?..%F{red}%?!%f%{$reset_color%})"

prompt_icon() {
if [[ "$PWD" = "$HOME" ]]; then
    echo " "
elif [[ "$PWD" = "$HOME/Documents" ]]; then
    echo " "
elif [[ "$PWD" = "$HOME/Downloads" ]]; then
    echo " "
elif [[ "$PWD" = "$HOME/Music" ]]; then
    echo " "
elif [[ "$PWD" = "$HOME/Pictures" ]]; then
    echo " "
elif [[ "$PWD" = "$HOME/Videos" ]]; then
    echo " "
elif [[ "$PWD" = "$HOME/.local/bin" ]]; then
    echo " "
else
    echo "ﱮ "
fi
}

#PROMPT='
#%B%F{blue}╔═════╣%b%f%B%F{white} %~ %b%f%B%F{blue}║$(git_prompt_info)%f
#%B%F{blue}╚═╣%b%f '
#RPROMPT='$return_code'

PROMPT='
%B%F{blue}┏━━━━━━┫%b%f%B%F{white} %~ %b%f%B%F{blue}┃$(git_prompt_info)%f
%B%F{blue}┗━━┫%b%f '
RPROMPT='$return_code'

ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{white} "
ZSH_THEME_GIT_PROMPT_SUFFIX=" %B%F{blue}┃"

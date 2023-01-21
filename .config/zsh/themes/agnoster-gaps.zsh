# vim:ft=zsh ts=2 sw=2 sts=2
#
### Segments of the prompt, default order declaration

typeset -aHg AGNOSTER_PROMPT_SEGMENTS=(
    prompt_status
    prompt_icon
#    prompt_context
    prompt_virtualenv
    prompt_dir
    prompt_git
)

### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

if [[ -z "$PRIMARY_FG" ]]; then
	PRIMARY_FG=black
fi

# Characters
SEGMENT_SEPARATOR="\ue0b0"
PLUSMINUS="\u00b1"
BRANCH="\ue0a0"
DETACHED="\u27a6"
CROSS="\u2718"
LIGHTNING="\u26a1"
GEAR="\u2699"

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg=${1:-default} fg=${2:-default} content=$3
  if [[ is_first_segment -eq 0 && $bg != default ]]; then
    print -n "%S%k%F{$bg}$SEGMENT_SEPARATOR%s"
  fi
  print -n "%K{$bg}%F{$fg} $content "
  if [[ $bg != default ]]; then
    print -n "%k%F{$bg}$SEGMENT_SEPARATOR%f"
  else
    print -n "%f"
  fi
  is_first_segment=0
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
prompt_context() {
  local user=`whoami`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CONNECTION" ]]; then
    prompt_segment $PRIMARY_FG default "%(!.%{%F{yellow}%}.)${user//\%/%%}@%m"
  fi
}

# Git: branch/detached head, dirty status
prompt_git() {
  local color ref
  is_dirty() {
    test -n "$(git status --porcelain --ignore-submodules)"
  }
  ref="${vcs_info_msg_0_//\%/%%}"
  if [[ -n "$ref" ]]; then
    if is_dirty; then
      color=yellow
      ref="${ref} $PLUSMINUS"
    else
      color=green
      ref="${ref} "
    fi
    if [[ "${ref/.../}" == "$ref" ]]; then
      ref="$BRANCH $ref"
    else
      ref="$DETACHED ${ref/.../}"
    fi
    prompt_segment $color $PRIMARY_FG "$ref"
  fi
}

# Dir: current working directory
prompt_dir() {
  prompt_segment blue $PRIMARY_FG '%20<...<%~%<<'
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}$CROSS"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}$LIGHTNING"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}$GEAR"

  [[ -n "$symbols" ]] && prompt_segment $PRIMARY_FG default "$symbols"
}

# Display current virtual environment
prompt_virtualenv() {
  if [[ -n $VIRTUAL_ENV ]]; then
    prompt_segment cyan $PRIMARY_FG "${${VIRTUAL_ENV:t}//\%/%%}"
  fi
}

## Main prompt
prompt_agnoster_main() {
  RETVAL=$?
  local -i is_first_segment=1
  for prompt_segment in "${AGNOSTER_PROMPT_SEGMENTS[@]}"; do
    [[ -n $prompt_segment ]] && $prompt_segment
  done
}

prompt_icon() {
    if [[ "$PWD" = "$HOME" ]] ; then
      prompt_segment '#3E4452' white ' '
    elif [[ "$PWD" = "$HOME/Documents" ]] ; then
      prompt_segment '#3E4452' white ' '
    elif [[ "$PWD" = "$HOME/Downloads" ]] ; then
      prompt_segment '#3E4452' white 'ﲐ '
    elif [[ "$PWD" = "$HOME/Music" ]] ; then
      prompt_segment '#3E4452' white ' '
    elif [[ "$PWD" = "$HOME/Pictures" ]] ; then
      prompt_segment '#3E4452' white ' '
    elif [[ "$PWD" = "$HOME/Videos" ]] ; then
      prompt_segment '#3E4452' white ' '
    elif [[ "$PWD" = "$HOME/.local/bin" ]] ; then
      prompt_segment '#3E4452' white ' '
    else prompt_segment '#3E4452' white 'ﱮ '
fi
}

prompt_agnoster_precmd() {
  vcs_info
  PROMPT='
%{%f%b%k%}$(prompt_agnoster_main) '
}

prompt_agnoster_setup() {
  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info

  prompt_opts=(cr subst percent)

  add-zsh-hook precmd prompt_agnoster_precmd

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' get-revision true
  zstyle ':vcs_info:*' check-for-changes true
  zstyle ':vcs_info:git*' formats '%b'
  zstyle ':vcs_info:git*' actionformats '%b (%a)'
}

prompt_agnoster_setup "$@"

function git_prompt_info() {
  # Determine if we are in a git directory (returns 0 if yes, error otherwise)
  # Redirecting output to /dev/null to silence error messages
  git -C . rev-parse &> /dev/null

  if [ $? == 0 ]; then;
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX ";
  fi;
}

local ret_status="%(?:%{$fg_bold[green]%}>:%{$fg_bold[red]%}>)$reset_color%"

PROMPT='
%{$fg[white]%}%c%{$reset_color%} $(git_prompt_info)${ret_status}  '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg_bold[red]"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg_bold[green]"


## Show vi mode on the right of shell
## as per http://stratus3d.com/blog/2017/10/26/better-vi-mode-in-zshell/

# Updates editor information when the keymap changes.
function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/[% NORMAL]%}/(main|viins)/[% INSERT]%}"
}

# define right prompt, regardless of whether the theme defined it
RPS1='$(vi_mode_prompt_info)'
RPS2=$RPS1

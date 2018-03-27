function git_prompt_info() {
  if [ -d .git ]; then;
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX ";
  fi;
}

local ret_status="%(?:%{$fg_bold[green]%}>:%{$fg_bold[red]%}>)$reset_color%"

PROMPT='%{$fg[white]%}%c%{$reset_color%} $(git_prompt_info)${ret_status}  '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg_bold[red]"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg_bold[green]"


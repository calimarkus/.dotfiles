# Enable colors
source $DOTFILES_DIR/zsh/spectrum.zsh
autoload colors && colors

# Load the git-flow-completion plugin
if [ -f $DOTFILES_DIR/plugins/git-flow-completion/git-flow-completion.zsh ]
then
  source $DOTFILES_DIR/plugins/git-flow-completion/git-flow-completion.zsh
fi

# Enable substitutions
setopt prompt_subst

# Theme colors
ZSH_THEME_PROMPT_PATH_COLOR=$FG[214]

source $DOTFILES_DIR/zsh/prompt-git
source $DOTFILES_DIR/zsh/prompt-hg

function ssh_prompt() {
  if [ $SSH_CONNECTION ]; then
    if [ "$cols" -gt 70 ]; then
      echo "%{$fg_bold[white]%}%M "
    else
      echo "%{$fg_bold[white]%}%m "
    fi
  fi
}

function left_prompt() {
  echo "$(ssh_prompt)%{$ZSH_THEME_PROMPT_PATH_COLOR%}%2c %{$reset_color%}"
}

function right_prompt() {
  if [ $(in_git) ]; then
    echo "$(git_prompt)%{$reset_color%}"
  elif [ $(in_hg) ]; then
    echo "$(hg_short_prompt)%{$reset_color%}"
  fi
}

PROMPT='$(left_prompt)'
RPROMPT='$(right_prompt)'

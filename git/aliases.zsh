g () {
  if [ $# -eq 0 ]
  then
    git status -sb
  else
    git $*
  fi
}
compdef g=git

alias gl='git log --oneline --graph --branches'
compdef _git gl=git-log

alias gl2='git log --oneline --graph --all'
compdef _git gl2=git-log

alias gs='git status'
compdef _git gs=git-status

compdef g drop=git checkout --

source $DOTFILES_DIR/secret/aliases.zsh

alias edit='open -e'
alias ll='ls -halF'

# Quick way to rebuild the Launch Services database and get rid
# of duplicates in the Open With submenu.
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

function gitrepo {
  echo "Enter GitHub password for jaydee3:"
  read -s pw

  if (( $# == 0 ))
  then
    echo "Enter the new repository name:"
    read repo
  else
    repo=$1
  fi

  echo "Creating Repository '${repo}'"
  echo "https://api.github.com/user/repos -d '{\"name\":\"${repo}\"}'"

  curl -u "jaydee3:${pw}" https://api.github.com/user/repos -d "{\"name\":\"${repo}\"}"

  echo "\n\nRepository '${repo}' created!"

  echo "Init local repository in current directory? (y/n)"
  read localRepo

  if [ "$localRepo" = "y" ] || [ "$localRepo" = "yes" ];
  then
    echo "Initalizing local repository..."
    git init
    git remote add origin git@github.com:jaydee3/${repo}
  fi
}

if [ -f $DOTFILES_DIR/secret/aliases.zsh ]
then
  source $DOTFILES_DIR/secret/aliases.zsh
fi

alias edit='open -e'
alias ll='ls -halF'
alias findhere='find . -name'

alias openDerivedData='open ~/Library/Developer/Xcode/DerivedData'
alias deleteDerivedData='; echo Deleting "~/Library/Developer/Xcode/DerivedData"; rm -rf ~/Library/Developer/Xcode/DerivedData; echo Deleted.'

alias pip3='python3 -m pip'

# Quick way to rebuild the Launch Services database and get rid
# of duplicates in the Open With submenu.
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

alias fixSteamMic='sudo sqlite3 ~/Library/Application\ Support/com.apple.TCC/TCC.db "INSERT or REPLACE INTO access VALUES('kTCCServiceMicrophone','com.valvesoftware.steam',0,1,1,NULL,NULL,NULL,'UNUSED',NULL,0,1551892126);"'

# faster time machine backups
alias fastBackupOn='sudo sysctl debug.lowpri_throttle_enabled=1'
alias fastBackupOff='sudo sysctl debug.lowpri_throttle_enabled=0'

# coloured diff side by side
alias diff='diff -W $(( $(tput cols) - 2 )) --color=always --side-by-side'

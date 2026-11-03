# zsh skips ~/.profile, and the desktop session gets its PATH from login files.
[[ -f "$HOME/.profile" ]] && emulate sh -c '. "$HOME/.profile"'

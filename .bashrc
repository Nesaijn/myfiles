.
.
.

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export TERMINAL=/usr/bin/alacritty
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
# Directory needs to be created
export HISTFILE=$XDG_CONFIG_HOME/bash/bash_history

LESSHISTFILE=-
# Directory and file needs to be created
alias wget="wget --config=$XDG_CONFIG_HOME/wget/wgetrc"
# Make it that vim does not create a viminfo file
alias vim="vim -i NONE"
# Make it so that the picture fits in the window. Could also add this parameter to the feh.desktop "Exec=feh -. --start-at %u"
alias feh="feh -."
#eval $(keychain --eval --quiet id_ed25519 id_rsa ~/.keys/my_custom_key)

.
.
.

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export TERMINAL=/usr/bin/urxvt
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
# Directory needs to be created
export HISTFILE=$XDG_CONFIG_HOME/bash/bash_history

LESSHISTFILE=-
# Directory and file needs to be created
alias wget="wget --config=$XDG_CONFIG_HOME/wget/wgetrc"
alias vim="vim -i NONE"
alias feh="feh -."

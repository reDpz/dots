#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '

# start x
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi

alias v=nvim
alias spac='sudo pacman -S --needed --noconfirm'
alias spa='sudo pacman'
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'

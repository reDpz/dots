# start x
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
else
# uncomment else statement then put things here to autostart.
  clear
fi

# when attempting to auto-fill with tab, ignore the capitalisation
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#
# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# enable colours
autoload -U colors && colors

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nora/.zshrc'

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
# End of lines added by compinstall
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='lsd -a'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '


# luke smith's stuff

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char


# Use lf to switch directories and bind it to ctrl-o
lfcd () {
  tmp="$(mktemp)"
  lf -last-dir-path="$tmp" "$@"
  if [ -f "$tmp" ]; then
      dir="$(cat "$tmp")"
      rm -f "$tmp"
      [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
  fi
}
bindkey -s '^r' 'lfcd\n'
#
# rustproj () {
#   st &
#   nvim src/main.rs
# }
#
# bindkey -s '^g' 'rustproj\n'

# run rust project
bindkey -s '^f' 'go run Main.go\n'
#
# delete backward word
my-backward-delete-word() {
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^W' my-backward-delete-word


# p10k
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# variables
export GOPATH=/home/nora/golib
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/home/nora/.local/bin

# aliases
# alias rm=trash-put
# alias 'rm -rf'='rm -rf'
alias relo='source ~/.zshrc'
alias v=nvim
alias spac='sudo pacman -S --needed --noconfirm'
alias spa='sudo pacman'
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias svim='sudo nvim'
alias psls='sudo ps_mem'
alias chad='cd ~/.config/nvim/lua/custom; git pull'
alias upgrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias xclip='xclip -selection clipboard'
alias cdbuild='cd ~/Documents/build; lfcd'
alias astro='cd /home/nora/.config/nvim/lua/user; git pull'
alias cdpro='cd ~/Documents/programming/; lfcd'
alias cdnotes='cd ~/Documents/Notes/; lfcd'
alias fetch=fastfetch
alias cdwi='cd ~/Documents/Notes/wiki;'
alias wiki='cd ~/Documents/Notes/wiki; nvim index.wiki'
alias cdgo="lfcd /home/nora/Documents/programming/go/src/github.com/reDpz"
alias nvimp='cd ~/.config/nvim/lua'

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias pacman='sudo pacman'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='\w 
-> '

#Launch Neofetch on Terminal launch
neofetch



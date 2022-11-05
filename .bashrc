#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && retur9

# # export PS1="[\u@\h] > \W \$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/') \n\\$ \[$(tput sgr0)\]"
# alias ls='ls --color'
# export PS1='[\u@\h] :: \[\e[33m\]\w\[\e[0m\]  '
# export EDITOR='vim' 

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias ls='ls --color'

export CLICOLOR=1
# Change to your name, do not delete backslashes
export PS1="komilsobitov\[\e[31m\] \[\e[m\]\[\e[31m\]:\[\e[m\]\[\e[31m\]:\[\e[m\] \[\e[32m\]\W\[\e[m\] \[\e[35m\]»\[\e[m\] "

export LSCOLORS=cxgxfxexbxegedabagacad

export EDITOR='vim'

# nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

#
# ~/.bashrc
#
set -o vi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="[\u@\h] > \W \$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/') \n\\$ \[$(tput sgr0)\]"
export EDITOR='vim'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Following line was automatically added by arttime installer
export PATH=/home/komil/.local/bin:$PATH

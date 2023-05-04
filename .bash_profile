#
# ~/.bash_profile
#

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Change to your name, do not delete backslashes
export LSCOLORS=cxgxfxexbxegedabagacad
export CLICOLOR=1
export EDITOR=vim
export VISUAL=vim

# bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/komil/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/komil/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/komil/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/komil/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

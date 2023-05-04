# Aliases
if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

HISTTIMEFORMAT="%F %T "
HISTCONTROL=ignoredups
HISTSIZE=10000
HISTFILESIZE=2000

shopt -s histappend

# Functions
# Find the largest files in a directory
function find_largest_files() {
    du -h -x -s -- * | sort -r -h | head -20;
}

# Display the current Git branch in the Bash prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function bash_prompt(){
    PS1="komilsobitov\[\e[31m\] \[\e[m\]\[\e[31m\]:\[\e[m\]\[\e[31m\]:\[\e[m\] \[\e[32m\]\W\[\e[m\] \[\e[35m\]»\[\e[91m\]\$(parse_git_branch) \[\e[00m\]"
    # PS1='${debian_chroot:+($debian_chroot)}'${blu}'$(git_branch)'${pur}' \W'${grn}' \$ '${clr}
}

bash_prompt

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

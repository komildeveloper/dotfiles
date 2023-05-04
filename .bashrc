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

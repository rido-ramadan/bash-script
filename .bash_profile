# Get current active git branch in a directory
function active_git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Enable bash completion
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

# Colors
reset="\e[0m"
black="\e[30m"
red="\e[31m"
green="\e[32m"
yellow="\e[33m"
blue="\e[34m"
magenta="\e[35m"
cyan="\e[36m"
light_green="\e[92m"
light_cyan="\e[96m"
light_yellow="\e[93m"
light_blue="\e[94m"
light_red="\e[91m"

# Change terminal format to: user@computer_name:absolute_path
PS1="\[$light_green\]\u\[$reset\]@"
PS1+="\[$cyan\]\h\[$reset\]:"
PS1+="\[$light_yellow\]\w\e[$reset\]"
PS1+="\[$light_blue\]\$(active_git_branch)\[$reset\] \n"
PS1+="\[$light_red\]$\[$reset\] "
PS2="\[$light_red\]>\[$reset\] "
export PS1
export PS2
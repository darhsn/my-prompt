###################
# My PS1 for BASH #
###################

# Colors
RED="\[\033[31m\]"
WHITE="\[\033[0m\]"
GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
PINK="\[\033[01;35m\]"
YELLOW="\[\033[33;1m\]"

# Functions that is executed
# every time that there is a new
# prompt
precmd() {
    if [ "$?" == "0" ]; then
        SHELL_COLOR="${WHITE}"
    else
        SHELL_COLOR="${RED}"
    fi

    GIT_BRANCH="$(git symbolic-ref --short HEAD 2>/dev/null)"

    if [ "${GIT_BRANCH}" == "" ]; then
        PS1="${PINK}\w${WHITE} ${SHELL_COLOR}\$${WHITE} "
    else
        PS1="${PINK}\w${WHITE}${GREEN} ${GIT_BRANCH} ${SHELL_COLOR}\$${WHITE} "
    fi
}

PROMPT_COMMAND="precmd"

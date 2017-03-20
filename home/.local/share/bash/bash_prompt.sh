##############################
# bash prompt
#############################

# COLORS LOL
       GRAY="\[$(tput setaf 0)\]"
        RED="\[$(tput setaf 1)\]"
      GREEN="\[$(tput setaf 2)\]"
 	 YELLOW="\[$(tput setaf 3)\]"
       BLUE="\[$(tput setaf 4)\]"
     PURPLE="\[$(tput setaf 5)\]"
       CYAN="\[$(tput setaf 6)\]"
      WHITE="\[$(tput setaf 7)\]"
 COLOR_NONE="\[$(tput sgr0)\]"

function prompt_func() {
    previous_return_value=$?;
    # The lowercase w is the full current working directory
    # prompt="${TITLEBAR}${BLUE}[${RED}\w${GREEN}$(__git_ps1 " (%s)")${BLUE}]${COLOR_NONE}"

    # Capital W is just the trailing part of the current working directory
    prompt="${TITLEBAR}${BLUE}[${RED}\W${GREEN}$(__git_ps1 " (%s)")${BLUE}]${COLOR_NONE}"

    if test $previous_return_value -eq 0
    then
        PS1="${prompt}> "
    else
        PS1="${prompt}${RED}>${COLOR_NONE} "
    fi
}

PROMPT_COMMAND=prompt_func

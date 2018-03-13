# .bashrc #####################################################################
#
#  Executed for all new non-login shells.

# Do nothing if we're not interactive
[ -z "$PS1" ] && return

# shell options ###############################################################

# append to ~/.bash_history, do not overwrite
shopt -s histappend
# keep the LINES and COLUMNS updated
shopt -s checkwinsize

# env #########################################################################

# default editor
export EDITOR=nvim

# enable 256-color support in TMUX sessions
[ -n "$TMUX" ] && export TERM=screen-256color

# bash-completion linux
[ -f /usr/share/bash-completion/bash_completion ] && \
    source /usr/share/bash-completion/bash_completion

# stuff for osx
if [ "$(uname)" = "Darwin" ]; then

    # bash-completion osx relies on brew
    [ -f $(brew --prefix)/etc/bash_completion ] && \
        source $(brew --prefix)/etc/bash_completion

    # bsd ls color flag
    alias ls='ls -G'
else
    # hopefully we're in linux
    alias ls='ls --color=auto'
fi

# push nodebrew bin to PATH if installed
[ -f ~/.nodebrew/current/bin/nodebrew ] && \
    export PATH=$HOME/.nodebrew/current/bin:$PATH

# local bash configuration snazzyness
[ -d ~/.config/bash.d ] && \
    for sh in ~/.config/bash.d/*; do source $sh; done

# ~/bin
[ -d ~/bin ] && \
    export PATH=$HOME/bin:$PATH

# aliases #####################################################################
alias grep="grep --color=auto"
alias tmux="tmux -u"
alias :q="exit"
alias shh='ssh'
alias vim='nvim'

# custom git prompt ###########################################################
# relies on bash-completion to set __git_ps1
source ~/.local/share/bash/bash_prompt.sh

#########################
# Settings for Mac OS X #
#########################

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Alias definitions
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL="erasedups:ignoreboth"

# No need to remember the exit command.
export HISTIGNORE="&:[ ]*:exit"

# Save multi-line commands to the history as one command.
shopt -s cmdhist

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=500000
HISTFILESIZE=100000

# sets up custom prompt
export GITAWAREPROMPT=~/bin/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\[\033[33;1m\]\W\[\033[m\]\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]$ "

# activates colors
export CLICOLOR=1

# ls custom colors
export LSCOLORS=ExFxBxDxCxegedabagacad

# Base16 Shell
BASE16_SHELL="/Users/zool/.config/base16-shell/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Completion Settings
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

source `brew --repository`/Library/Contributions/brew_bash_completion.sh
source ~/bin/git-completion.bash
source ~/bin/tmux.completion.bash
source ~/bin/tmuxinator.bash

# add homebrew bin folder to PATH
export PATH="/usr/local/bin:$PATH"

# add node bin folder to PATH
export PATH="$HOME/.node/bin:$PATH"

# Add my bin folder
export PATH="$HOME/bin/:$PATH"

# Set Vim as default editor
export EDITOR="vim"

# Jump and mark functions.
export MARKPATH=$HOME/.marks
function jump { 
cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
  }
  function mark { 
  mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark { 
rm -i "$MARKPATH/$1"
  }
  function marks {
  \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}

# Tab completion for jump and unmark functions
function _jump {
local cur=${COMP_WORDS[COMP_CWORD]}
local marks=$(find $MARKPATH -type l | awk -F '/' '{print $NF}')
COMPREPLY=($(compgen -W '${marks[@]}' -- "$cur"))
return 0
  }
  complete -o default -o nospace -F _jump jump

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/.profile

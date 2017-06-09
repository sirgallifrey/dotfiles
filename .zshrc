export PATH=~/bin:$PATH
export PATH=~/npm/bin:$PATH
export VISUAL=vim
export EDITOR="$VISUAL"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
if [[ -n "$POWERLEVEL9K_INSTALLATION_PATH" ]]; then
else
  if [[ -n "$ADOTDIR" ]]; then
  else 
    ADOTDIR=$HOME/.antigen
  fi
  POWERLEVEL9K_INSTALLATION_PATH=$ADOTDIR/bundles/bhilburn/powerlevel9k
fi

plugins=(git)

function clone {
    (cd ~/Projects; git clone "$@")
}
alias cd-projects='cd ~/Projects'
alias cdp=cd-projects
alias npm="npm --color=always"
alias ls="ls -lh --color"

if [ -r ~/.zsh_functions ]; then
   source ~/.zsh_functions
fi

if [ -r ~/.zsh_custom  ]; then
   source ~/.zsh_custom
fi

if [ -r ~/.zsh_aliases ]; then
   source ~/.zsh_aliases
fi

source ~/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle git-flow-avh
antigen bundle github
antigen bundle pip
antigen bundle lol
antigen bundle command-not-found
antigen bundle history
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle supercrabtree/k

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle Vifon/deer

# Load the theme.
antigen theme bhilburn/powerlevel9k powerlevel9k
# Tell antigen that you're done.
antigen apply

autoload -U deer
zle -N deer
bindkey '\ek' deer

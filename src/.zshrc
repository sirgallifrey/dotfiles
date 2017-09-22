export PATH=~/bin:$PATH
export PATH=~/npm/bin:$PATH
export PATH=~/.gem/ruby/2.4.0/bin:$PATH
export VISUAL=vim
export EDITOR="$VISUAL"
export TERM="xterm-256color" 

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
alias npm="npm --color=always"

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
antigen bundle history
antigen bundle unixorn/autoupdate-antigen.zshplugin

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting


# Load the theme.
antigen theme bhilburn/powerlevel9k powerlevel9k
# Tell antigen that you're done.
antigen apply

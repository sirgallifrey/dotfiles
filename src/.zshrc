export usb=/run/media/$(whoami)/
export USB=/run/media/$(whoami)/
export RUST_BACKTRACE=1

# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Use colors for less, man, etc.
[[ -f ~/.less_termcap ]] && . ~/.less_termcap

# use nvm stuff
[[ -f /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh

alias ..="cd .."
alias 1..="cd .."
alias 2..="cd ../.."
alias 3..="cd ../../.."
alias 4..="cd ../../../.."
alias 5..="cd ../../../../.."
alias 6..="cd ../../../../../.."
alias ~="cd ~"
alias p="cd ~/projects"

## where media automounts in archlinux
## have to rethink this as Iḿ using 
alias usb="cd /run/media/$(whoami)/"
alias media="cd /run/media/$(whoami)/"

alias reload="exec ${SHELL} -l"

alias path='echo -e ${PATH//:/\\n}'

alias zshrc='${=EDITOR} ~/.zshrc' # Quick access to the ~/.zshrc file

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '


alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'

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

if [ -r ~/.zsh_custom  ]; then
  source ~/.zsh_custom
fi

source ~/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle zsh-users/zsh-completions

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme bhilburn/powerlevel9k powerlevel9k
# Tell antigen that you're done.
antigen apply


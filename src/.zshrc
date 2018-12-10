export PATH=~/bin:$PATH
export PATH=~/npm/bin:$PATH
export VISUAL=vim
export EDITOR="$VISUAL"
export TERM="xterm-256color" 
export usb=/run/media/$(whoami)/
export USB=/run/media/$(whoami)/
export RUST_BACKTRACE=1
export SSH_ASKPASS=ksshaskpass
# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"

if [[ $(which yarn) ]]; then
  export PATH=$(yarn global dir)/node_modules/.bin:$PATH
fi

if [[ -d ~/Android/Sdk ]]; then
  export ANDROID_HOME=~/Android/Sdk
  export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
fi

if [[ -d /opt/dotnet ]]; then
  export PATH=/opt/dotnet:$PATH
fi

# Use colors for less, man, etc.
[[ -f ~/.less_termcap ]] && . ~/.less_termcap

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
alias usb="cd /run/media/$(whoami)/"
alias media="cd /run/media/$(whoami)/"

alias reload="exec ${SHELL} -l"

alias path='echo -e ${PATH//:/\\n}'

# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias zshrc='${=EDITOR} ~/.zshrc' # Quick access to the ~/.zshrc file

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias sortnr='sort -n -r'
alias unexport='unset'

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
  (cd ~/projects; git clone "$@")
}

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
antigen bundle archlinux
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle djui/alias-tips

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme bhilburn/powerlevel9k powerlevel9k
# Tell antigen that you're done.
antigen apply

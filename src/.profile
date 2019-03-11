# fix for enpass app on non KDE desktop                                         
if [[ ! $QT_AUTO_SCREEN_SCALE_FACTOR ]]                       
then                                                                            
  export QT_AUTO_SCREEN_SCALE_FACTOR=0                                          
fi                                                                              
if [[ ! $QT_SCREEN_SCALE_FACTORS ]]                           
then                                                                            
  export QT_SCREEN_SCALE_FACTORS="1;1"                                          
fi                                                                              

PATH="$HOME/npm/bin:$HOME/.local/bin:$HOME/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"

if [[ $(command -v yarn >> /dev/null) ]]; then
  PATH=$(yarn global dir)/node_modules/.bin:$PATH
fi

## arch linux stuff
if [[ -d /opt/dotnet ]]; then
  PATH=/opt/dotnet:$PATH
  export DOTNET_ROOT=/opt/dotnetenv
fi

if [[ -d ~/Android/Sdk ]]; then
  export ANDROID_HOME=~/Android/Sdk
  PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
fi

export PATH 

export VISUAL=vim
export EDITOR="$VISUAL"
export TERM="xterm-256color" 

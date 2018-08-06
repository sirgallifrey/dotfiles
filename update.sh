RELATIVE_PATH="`dirname \"$0\"`"
DIRNAME="`( cd \"$RELATIVE_PATH\" && pwd )`" 

function copy_files () {
  cp -rv "$DIRNAME/src/." ~/
}
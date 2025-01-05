# Make a directory and then immediately cd into it.
function mkcd() { 
  mkdir -p "$1" && cd "$1"
}

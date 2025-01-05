# cd to the directory open in the frontmost MacOS Finder window.
function cdf() {
  cd "$(osascript <<OSA
tell application "Finder" to return \
the POSIX path of \
(the insertion location as text)
OSA
)"
}

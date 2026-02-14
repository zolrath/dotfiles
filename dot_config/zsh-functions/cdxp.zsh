# cd to the directory of the currently open project in the frontmost Xcode window.
function cdxp() {
  cd "$(osascript <<OSA
tell application "Xcode"
    set filePath to path of last item of source documents
    set filePOSIXPath to POSIX path of filePath
    set parentFolderPOSIXPath to do shell script "dirname " & quoted form of filePOSIXPath
    return parentFolderPOSIXPath
end tell
OSA
)"
}

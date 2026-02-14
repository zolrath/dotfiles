# cd to the directory of the currently open file in the frontmost Xcode window.
function cdx() {
  cd "$(osascript <<OSA
  tell application "Xcode"
      set fileName to (word -1 of (get name of window 1))

      -- If the file has unsaved changes it adds Edited to the end, go back one word.
      if (fileName is "Edited") then
          set fileName to (word -2 of (get name of window 1))
      end if

      set filePath to path of document 1 whose name ends with fileName
      set filePOSIXPath to POSIX path of filePath

      set parentFolderPOSIXPath to do shell script "dirname " & quoted form of filePOSIXPath

      return parentFolderPOSIXPath
  end tell
OSA
)"
}

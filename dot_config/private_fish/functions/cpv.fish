function cpv --description "copy target with progress bar"
  rsync -ah --info=progress2 $argv
end

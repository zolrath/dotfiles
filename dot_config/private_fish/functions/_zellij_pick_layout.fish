function _zellij_pick_layout
  # get the zellij configured layout directory
  set -l layout_dir (zellij setup --check | grep "LAYOUT DIR" - | grep -o '".*"' - | tr -d '"')

  # if the layout dir exists
  if test -d $layout_dir
    # get all .kdl files in the layout dir, remove the path and extension, and fzf them
    set -l default_layouts (string join \n default strider compact)
    set -l custom_layouts (fd -e kdl . $layout_dir | sed 's|.*/||' | sed 's|\.[^.]*$||')

    set layout (printf "%s\n" $default_layouts $custom_layouts | sort | fzf --layout=reverse-list --query="$argv")

    if test -n "$layout"
      echo "$layout"
      return 0
    else
      return 1
    end
  else
    return 1
  end
end

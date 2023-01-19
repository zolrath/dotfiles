function zjl --description "run zellij with layout"
    if ! command -v fzf >/dev/null
        echo >&2 "fzf command not found"
        return 1
    end

    # determine the project home
    set -l layout_dir (zellij setup --check | grep "LAYOUT DIR" - | grep -o '".*"' - | tr -d '"')

    if test -d $layout_dir
      set layout (fd -e kdl . $layout_dir | sed 's|.*/||' | sed 's|\.[^.]*$||' | sort | fzf --layout=reverse-list --query="$argv")

      if test -n "$layout"
        zellij --layout $layout
      else
        echo "No layout selected"
        return 1
      end
    else
      return 1
    end
end

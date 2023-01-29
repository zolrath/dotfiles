function zjl --description "run zellij with layout"
    if ! command -v fzf >/dev/null
        echo >&2 "fzf command not found"
        return 1
    end

  set -l layout (_zellij_pick_layout $argv)

  if test -n "$layout"
    zellij --layout "$layout"
  else
    echo "No layout selected"
    return 1
  end
end

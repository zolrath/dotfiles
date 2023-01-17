function prjsesh --description "create session in project folder"
    if ! command -v fzf >/dev/null
        echo >&2 "fzf command not found"
        return 1
    end

    # determine the project home
    set -q PROJECTS || set PROJECTS ~/code
    set -l gitprj_git $PROJECTS/*/.git/ $PROJECTS/*/*/.git/
    set -l gitprj (dirname $gitprj_git)
    set prjlist (string replace $PROJECTS/ "" (realpath $gitprj))
    set selection (printf "%s\n" $prjlist | sort | fzf --layout=reverse-list --query="$argv")
    set session_name (basename $selection)

    set -l zj_sessions (zellij list-sessions)

    if test (contains $session_name $zj_sessions)
        zellij attach "$session_name"
    else
      if test -d $PROJECTS/$selection
          cd $PROJECTS/$selection
          zellij attach -c "$session_name"
          prevd
      else if test -d $selection
          cd "$selection"
          zellij attach -c "$session_name"
          prevd
      else
          echo $PROJECTS/$selection
      end
    end
end

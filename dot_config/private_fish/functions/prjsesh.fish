function prjsesh --description "create session in project folder"
    if ! command -v fzf >/dev/null
        echo >&2 "fzf command not found"
        return 1
    end

    # determine the project home
    set -q PROJECTS || set PROJECTS ~/code
    set -l gitprj_git $PROJECTS/*/.git/ $PROJECTS/*/*/.git/ $PROJECTS/*/*/*/.git/
    set -l gitprj (dirname $gitprj_git)

    set prjlist (string replace $PROJECTS/ "" (realpath $gitprj))
    set selection (printf "%s\n" $prjlist | sort | fzf --layout=reverse-list --query="$argv")

    if ! test -n "$selection"
        echo "No project selection made"
        return 1
    end

    set session_name (basename $selection)
    set -l zj_sessions (zellij list-sessions)

    # If the session already exists just attach to it
    if contains "$session_name" $zj_sessions
        echo "Project session ($session_name) already exists, attaching."
        zellij attach "$session_name"
    else
        # Move to the project folder
        if test -d $PROJECTS/$selection
            cd $PROJECTS/$selection
        else if test -d $selection
            cd "$selection"
        else
            echo "Project folder not found."
            echo $PROJECTS/$selection
            retun 1
        end

        # Select a layout
        set -l layout (_zellij_pick_layout)

        # If they selected a layout, use it, otherwise just make the session
        if test -n "$layout"
            echo "Creating new session $session_name with layout $layout"
            zellij -s "$session_name" -l "$layout"
        else
            echo "Creating new session $session_name"
            zellij -s "$session_name"
        end
        prevd
    end
end

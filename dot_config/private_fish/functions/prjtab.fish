function prjtab --description "Project in new zellij tab"
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

    # Select a layout
    set -l layout (_zellij_pick_layout)

    set -l destination invalid

    if test -d $PROJECTS/$selection
        set -l destination $PROJECTS/$selection
    else if test -d $selection
        set -l destination $selection
    else
        echo $PROJECTS/$selection
    end

    # If they selected a layout, use it, otherwise just make the session
    if test -n "$layout"
        set -l layout_dir (zellij setup --check | grep "LAYOUT DIR" - | grep -o '".*"' - | tr -d '"')
        echo "Creating new tab for project $selection with layout $layout"
        echo "$layout_dir/$layout"
        zellij action new-tab -c "$selection" -l "$layout_dir/$layout"
    else
        echo "Creating new tab for project $selection"
        zellij action new-tab -c "$selection" -l default
    end
end

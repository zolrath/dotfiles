function prjtab --description "Project in new zellij tab"
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
    if test -d $PROJECTS/$selection
        zellij action new-tab -c "$PROJECTS/$selection" -l default
    else if test -d $selection
        zellij action new-tab -c "$selection" -l default
    else
        echo $PROJECTS/$selection
    end
end

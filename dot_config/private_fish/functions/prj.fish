function prj --description "Project jump"
    if ! command -v fzf >/dev/null
        echo >&2 "fzf command not found"
        return 1
    end

    # determine the project home
    set -q PROJECTS || set PROJECTS ~/code
    set -l gitprj (find $PROJECTS -type d -name ".git" -maxdepth 4 -exec dirname {} \;)
    set prjlist (string replace -i $PROJECTS/ "" (realpath $gitprj))
    set selection (printf "%s\n" $prjlist | sort | fzf --layout=reverse-list --query="$argv")
    if test -d $PROJECTS/$selection
        cd $PROJECTS/$selection
    else if test -d $selection
        cd $selection
    else
        echo $PROJECTS/$selection
    end
end

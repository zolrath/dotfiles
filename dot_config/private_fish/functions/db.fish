function db
    set dbname (
          docker ps --all --filter "name=_dev\$" --format "{{.Names}}{{if eq (index (split .Status \" \") 0) \"Up\"}} 👈{{end}}" | 
          string replace -r '_dev$' '' |
          string replace -r '_dev 👈$' ' 👈' |
          sort | 
          fzf --select-1 --query="$argv" --prompt="start db> "
    )
    if not string length -q -- $dbname
        echo "No database selected."
        echo "To create a new dev database use `dbnew <dbname>`"
    else
        dbup (string replace -r ' 👈' '' $dbname)
    end
end

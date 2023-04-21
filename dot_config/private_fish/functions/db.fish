function db
    set dbname (
          docker ps --all --filter "name=_dev\$" --format "{{.Names}}" | 
          string replace -r '_dev$' '' |
          sort | 
          fzf --select-1 --query="$argv" --prompt="start db> "
    )
    if not string length -q -- $dbname
        echo "No database selected."
        echo "To create a new dev database use `dbnew <dbname>`"
    else
        dbup $dbname
    end
end

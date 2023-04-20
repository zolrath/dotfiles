function dbup
    if string match -q "$argv[1]_dev" in (docker ps --all --format '{{.Names}}')
        if string match -q "$argv[1]_dev" in (docker ps --format '{{.Names}}')
            echo "$argv[1]_dev already running"
        else
            echo "Stopping all other containers using port 5432."
            dbdown

            echo "Starting $argv[1]_dev"
            docker start $argv[1]_dev
        end
    else
        echo "Whoa, never heard of that database. Here's what I know:"
        echo ""
        dblist
        echo ""
        echo "To create a new dev database use `dbnew <dbname>`"
    end
end

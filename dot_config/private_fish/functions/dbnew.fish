function dbnew
    dbdown
    docker run --name $argv[1]_dev -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres 1>/dev/null
    if test $status -eq 0
        echo "Created new dev db: $argv[1]_dev"
    else
        echo "Failed to new dev db: $argv[1]_dev"
    end
end

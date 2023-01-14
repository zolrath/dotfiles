function devdb
    docker run --name $argv[1]_dev -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres
end

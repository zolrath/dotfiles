function dbnew --argument-names db_name
    if test -n "$db_name"
        dbdown
        set filtered (string replace -r '_dev$' '' $db_name)_dev

        docker run --name $filtered -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres 1>/dev/null
        if test $status -eq 0
            echo "Created new dev db: $filtered"
        else
            echo "Failed to new dev db: $filtered"
        end
    else
        echo "You must provide a database name: `dbnew <dbname>`"
        echo "REMINDER: This command will append _dev to the name provided."
        echo "Simply use the name of the project, do not include _dev yourself."
    end

end

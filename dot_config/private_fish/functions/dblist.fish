function dblist
    # --filter "expose=5432" 
    # seems stopped containers don't report their previously used ports
    # so this filters too aggressively
    #
    set active (docker ps --format '{{.Names}}' --filter "expose=5432" --filter "name=_dev\$")
    for db in (docker ps --all --filter "name=_dev\$" --format "{{.Names}}" | sort)
        if string match -q $active $db
            echo "👉" (string replace -r '_dev$' '' $db)
        else
            echo "  " (string replace -r '_dev$' '' $db)
        end
    end
end

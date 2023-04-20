function dblist
    # --filter "expose=5432" 
    # seems stopped containers don't report their previously used ports
    # so this filters too aggressively
    for db in (docker ps --all --filter "name=_dev\$" --format "{{.Names}}")
        echo (string replace -r '_dev$' '' $db)
    end
end

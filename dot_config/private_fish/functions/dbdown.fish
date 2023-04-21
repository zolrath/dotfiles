function dbdown
    for id in (docker ps -q --format '{{.Names}}' --filter "expose=5432")
        echo Stopping (docker stop $id)
    end
end

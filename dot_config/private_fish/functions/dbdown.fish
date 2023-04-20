function dbdown
    for id in (docker ps -q)
        if string match -q 5432 -e (docker port $id)
            echo "Stopping container $id"
            docker stop $id
        end
    end
end

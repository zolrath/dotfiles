function vicd
    set dst "$(command vifm . ~ --choose-dir - $argv[2..-1])"
    if [ -z "$dst" ]; 
        echo 'Directory picking cancelled/failed'
        return 1
    end
    cd "$dst"
end

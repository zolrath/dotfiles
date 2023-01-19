function zja --description "attach zellij to running session"
    if ! command -v fzf >/dev/null
        echo >&2 "fzf command not found"
        return 1
    end

    set -l zj_sessions (zellij list-sessions)
    set -l sessions (count $zj_sessions)

    if test (count $zj_sessions) -gt 1
        set -l session (printf "%s\n" $zj_sessions | fzf --layout=reverse-list --query="$argv")

        if test -n "$session"
          zellij attach $session
        else
          echo "No session selected"
          return 1
        end
    else
        zellij attach -c
    end
end

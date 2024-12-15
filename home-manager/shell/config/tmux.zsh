# tmux conf
if [[ ! -n $TMUX && $- == *l* ]]; then
    session_list=$(tmux list-sessions 2>/dev/null)
    if [[ -z "$session_list" ]]; then
        tmux new-session
    else
        create_new_session="Create New Session"
        session_list="$session_list\n${create_new_session}:"

        selected_session=$(echo "$session_list" | fzf | cut -d: -f1)

        if [[ "$selected_session" == "${create_new_session}" ]]; then
            tmux new-session
        elif [[ -n "$selected_session" ]]; then
            tmux attach-session -t "$selected_session"
        else
            :
        fi
    fi
fi

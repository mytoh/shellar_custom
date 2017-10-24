#!/bin/sh

set -o errexit
set -o nounset

attach() {
    local session
    session="${1}"

    command tmux -2 attach -t ${session}
}

session::main() {
    local session
    local window
    session="main"
    window="main"

    command tmux new-session -s ${session} -n ${window} -d
}

session::remote() {
    local session
    local window
    session="remote"
    window="sdf"

    command tmux new-session -s ${session} -n ${window} -d 'dbclient -K 30 sdf.org' \; set-window-option -q -t :0 remain-on-exit on
}

session::daemon() {
    local session
    local window
    session="daemon"
    window="futaba"

    command tmux new-session -s ${session} -n ${window} -d 'cd huone/kuvat/sivusto/futaba/b' \; set-window-option -q -t :0 remain-on-exit on
}

session::stats() {
    local session
    local window
    session="stats"
    window="top"

    command tmux new-session -s ${session} -n ${window} -d 'top' \; set-window-option -q -t :0 remain-on-exit on
}

session::jail() {
    local session
    local window
    session="jail"
    window="jail"

    command tmux new-session -s ${session} -n ${window} -d 'mosh peca@192.168.1.21' \; set-window-option -q -t :0 remain-on-exit on
}


main() {

    session::main
    session::remote
    session::daemon
    session::stats

    attach main
}

main

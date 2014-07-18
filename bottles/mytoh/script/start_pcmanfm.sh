#!/bin/sh

main() {
    if ! $(command pgrep pcmanfm >/dev/null)
    then
        command pcmanfm --daemon-mode &
        command sleep 2
        command pcmanfm &
    fi
}

main

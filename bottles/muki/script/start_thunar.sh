#!/bin/sh

main() {
    if ! $(command pgrep thunar >/dev/null)
    then
        command thunar --daemon &
        command sleep 2
        command thunar &
    fi
}

main

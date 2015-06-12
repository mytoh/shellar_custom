#!/bin/sh

main() {
    killall -9 $1
    xo "\n (╯°□°）╯︵ {:command}\n" $(toilet -f term -F rotate ${1})
}

main $*

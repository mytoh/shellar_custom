#!/bin/sh

main() {
killall -9 $1
echo -e "\n (╯°□°）╯︵ $(echo $1 | toilet -f term -F rotate)\n"
}

main $*

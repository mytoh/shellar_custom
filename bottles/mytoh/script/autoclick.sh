#!/bin/sh

main() {
    while [ 1 ]; do
        local CLICKS SLEEP
        CLICKS=4000
        SLEEP=2
        ## xdotool getmouselocation
        ## click [1] left [2] middle [3] right button
        xdotool mousemove 106 230 click --delay 30 --repeat ${CLICKS} 3 mousemove restore
        sleep ${SLEEP}

         xdotool mousemove 430 416 click --delay 500 --repeat 4 3 mousemove restore
         sleep 0.5
        # xdotool mousemove 430 381 click --delay 1000 --repeat 2 3 mousemove restore
        # sleep ${SLEEP}
    done
}

sleep 2
main

#!/bin/sh

###
## - disable relic popup
## - `xdotool getmouselocation` to get mouse position
## - cid collapsed
###

focus_heroes_list() {

    # x:434 y:517 screen:0 window:25165868
    xdotool mousemove  --sync 434 517

}

focus_monster() {

    # x:894 y:553 screen:0 window:25165868
    xdotool mousemove  --sync 894 553
}

scroll_to_bottom_hlist() {

    # clik 5 = wheel down
    xdotool click --repeat 50 5
}


scroll_to_top_hlist() {

    # clik 4 = wheel up
    xdotool click --repeat 50 4
}

scroll_down() {
    local num
    num=$1

    xdotool click --repeat $num 5
}


buy_hero_treebeast() {

    # x:171 y:413 screen:0 window:25165868
    local x y repeat
    x=119
    y=413
    repeat=100

    focus_monster
    focus_heroes_list
    scroll_to_top_hlist

    xdotool mousemove --sync $x $y \
            click --delay 100 --repeat $repeat 3

    focus_monster
}

buy_hero_ivan() {
    local x y repeat
    x=119
    y=527
    repeat=100

    focus_monster
    focus_heroes_list
    scroll_to_top_hlist

    # x:146 y:527 screen:0 window:25165868
    xdotool mousemove  --sync  146 527 \
            click --delay 100 --repeat $repeat 3

    focus_monster
}

buy_hero_brittany() {
    local x y repeat
    x=119
    y=650
    repeat=100

    focus_monster
    focus_heroes_list
    scroll_to_top_hlist

    # x:139 y:650 screen:0 window:25165868
    xdotool mousemove  --sync $x $y \
            click --delay 100 --repeat 100 3

    focus_monster
}


buy_hero_samurai() {
    local x y repeat
    x=119
    y=710
    repeat=400

    focus_monster
    focus_heroes_list
    scroll_to_top_hlist
    scroll_down 4

    # x:132 y:718 screen:0 window:25165868
    xdotool mousemove  --sync $x $y \
            click --delay 100 --repeat $repeat 3

    focus_monster
}


buy_hero_seer() {
    local x y repeat
    x=119
    y=693
    repeat=100

    focus_monster
    focus_heroes_list
    scroll_to_top_hlist
    scroll_down 7

    # x:108 y:693 screen:0 window:25165868
    xdotool mousemove  --sync $x $y
    xdotool click --delay 100 --repeat 100 3

    focus_monster
}

buy_hero_phthalo() {
    local x y repeat
    x=119
    y=717
    repeat=100

    focus_monster
    focus_heroes_list
    scroll_to_top_hlist
    scroll_down 38

    # x:119 y:717 screen:0 window:25165868
    xdotool mousemove  --sync $x $y
    xdotool click --delay 100 --repeat $repeat 3

    focus_monster
}


buy_hero_atlas() {

    local x y repeat
    # x:121 y:689 screen:0 window:12582956
    x=121
    y=689
    repeat=200

    focus_monster
    focus_heroes_list
    scroll_to_top_hlist
    scroll_down 37

    xdotool mousemove  --sync $x $y
    xdotool click --delay 100 --repeat "$repeat" 3

    focus_monster
}

buy_hero_banana() { # Orntchya

    local x y repeat
    # x:110 y:593 screen:0 window:12582956
    x=110
    y=603
    repeat=100

    focus_monster
    focus_heroes_list
    scroll_to_top_hlist
    scroll_down 38

    xdotool mousemove  --sync $x $y
    xdotool click --delay 100 --repeat "$repeat" 3

    focus_monster
}

buy_hero_last_available() {
    local x y repeat
    x=119
    y=529
    repeat=100

    focus_monster
    focus_heroes_list
    scroll_to_bottom_hlist

    ## xdotool getmouselocation
    ## right hand button, click: [1], left: [2], middle: [3] right button
    ## left hand button, leftclick: 3
    ## mousemove [options] x y OR 'restore'
    ## x:158 y:529 screen:0 window:25165868
    xdotool mousemove  --sync $x $y \
            click --delay 100 --repeat 100 3

}

buy_upgrades(){
    local x y repeat
    x=361
    y=699
    repeat=100

    focus_monster
    focus_heroes_list
    scroll_to_bottom_hlist

    # x:361 y:699 screen:0 window:25165868
    xdotool mousemove  --sync $x $y \
            click  3
}


# main() {
#     while [ 1 ]; do
#         local CLICKS SLEEP
#         CLICKS=4000
#         SLEEP=2
#         ## xdotool getmouselocation
#         ## click [1] left [2] middle [3] right button
#         # x:158 y:529 screen:0 window:25165868
#         xdotool mousemove 106 230 click --delay 30 --repeat ${CLICKS} 3 mousemove restore


#         sleep ${SLEEP}

#         # xdotool mousemove 430 416 click --delay 1000 --repeat 4 3 mousemove restore
#         # sleep 0.5
#         # xdotool mousemove 430 381 click --delay 10000 --repeat 2 3 mousemove restore
#         # sleep ${SLEEP}
#     done
# }

# sleep 2
# main

main_idle_late() {
    while true
    do
        # local wid
        # wid=$(xdotool search --classname "Conkeror" | tr -d '\n')
        # xdotool windowactivate --sync "$wid"
        buy_upgrades
        buy_hero_last_available
        buy_upgrades
        buy_hero_treebeast
        buy_hero_ivan
        buy_hero_brittany
        buy_hero_samurai
        buy_hero_seer
        # buy_hero_phthalo
    done
}


main_samurai() {
    while true
    do
        # xdotool windowactivate --sync "$wid"
        buy_upgrades
        buy_hero_last_available
        buy_upgrades
        buy_hero_samurai
    done
}


main_atlas() {
    while true
    do
        # xdotool windowactivate --sync "$wid"
        buy_upgrades
        buy_hero_last_available
        buy_upgrades
        buy_hero_atlas
    done
}


main_banana() {
    while true
    do
        # xdotool windowactivate --sync "$wid"
        buy_upgrades
        buy_hero_last_available
        buy_upgrades
        buy_hero_banana
    done
}


main_all_from_top() {
    local repeat
    repeat=50

    while true
    do
        # buy_upgrades
        # buy_hero_last_available
        buy_upgrades
        scroll_to_top_hlist

        for i in $(seq 24)
        do

            focus_monster
            focus_heroes_list

            # levelup buttons height is 71
            xdotool mousemove --sync 120 419 \
                    click --delay 100 --repeat $repeat 3 \
                    mousemove --sync 120 492 \
                    click --delay 100 --repeat $repeat 3

            scroll_down 2

        done
    done
}


main() {
    case $1 in
        idle_late)
            main_idle_late
            ;;
        samurai)
            main_samurai
            ;;
        atlas)
            main_atlas
            ;;
        banana)
            main_banana
            ;;
        all_top)
            main_all_from_top
            ;;
        *)
            main_idle_late
    esac
}

main "$@"

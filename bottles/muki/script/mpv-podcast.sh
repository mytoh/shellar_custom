#!/bin/sh

set -o nounset
set -o errexit

readonly PROGNAME=$(basename $0)
readonly PROGDIR=$(readlink $(dirname $0))
readonly ARGS="${@}"
readonly NARGS="${#}"


main() {
    local speed=1.5
    mpv --af=scaletempo --speed=${speed} ${ARGS}
}

main

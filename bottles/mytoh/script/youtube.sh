#!/bin/sh

set -o nounset
set -o errexit

readonly PROGNAME=$(basename $0)
readonly PROGDIR=$(readlink $(dirname $0))
readonly ARGS="${@}"
readonly NARGS="${#}"

main() {
    local url rargs
    if test -z ${ARGS}
    then
        echo "You must supply an argument!" >&2
        exit 1
    fi

    url=${1}
    if test -d "${HOME}/tmp"
    then
        mpv -cookies -cookies-file "${HOME}/tmp/ytcookie.txt" $(youtube-dl -g --cookies "$HOME/tmp/ytcookie.txt" "${1}")
    else
        mkdir -pv "${HOME}/tmp"
        mpv -cookies -cookies-file "${HOME}/tmp/ytcookie.txt" $(youtube-dl --get-url --cookies "${HOME}/tmp/ytcookie.txt" "${1}")
    fi
}

main ${ARGS}

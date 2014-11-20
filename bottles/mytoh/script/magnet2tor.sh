#!/bin/sh

set -o nounset
set -o errexit

readonly PROGNAME=$(basename $0)
readonly PROGDIR=$(readlink $(dirname $0))
readonly ARGS="${@}"
readonly NARGS="${#}"


main() {
    local magnet
    magnet="${1}"
    aria2c --bt-save-metadata=true --bt-metadata-only=true ${magnet}
}

main "${ARGS}"

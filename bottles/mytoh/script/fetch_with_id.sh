#!/bin/sh

set -o nounset
set -o errexit

readonly PROGNAME=$(basename $0)
readonly PROGDIR=$(readlink $(dirname $0))
# readonly ARGS="${@}"
readonly NARGS="${#}"

# http://sukebei.nyaa.se/?page=download&tid=1127698

get_file() {
    local url id
    url="${1}"
    id=$(echo "${url}" | sed -E 's/.*tid=(.+)/\1/g')

    echo "$url"
    echo "$id"

    aria2c --follow-torrent=false --out="${id}.torrent" "${url}"

    rename_file "${id}"

}

rename_file() {
    local id origname tname toname
    id="${1}"
    origname="${id}.torrent"
    tname=$(aria2c --show-files "${origname}" | grep Name | sed -E 's/Name: (.*)/\1/g')
    toname="${id}_${tname}"

    xo "{:name}\n" "${toname}"

    mv "${origname}" "${toname}.torrent"
}

main() {
    for i in "${@}"
    do
        get_file "${i}"
    done
}

main "${@}"

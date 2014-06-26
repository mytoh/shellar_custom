#!/usr/bin/env sh

set -o errexit
set -o nounset

ARGS="${@}"
readonly ARGS
PROGNAME="$(basename $0)"
readonly PROGNAME

log()
{
    local message="${1}"
    local m_colour="[38;5;39m"
    local s_colour="[38;5;169m"
    local reset="[0m"

    cat <<EOF
*************************************************************
$s_colour>>$reset $m_colour $message $reset $s_colour<<$reset
*************************************************************
EOF
}


mkv_to_mkv() {
    local _orig _temp
    _orig="${1}"
    _temp="$(mktemp -t ${PROGNAME})"
    _new="new_${_orig%.*}.mkv"

    log "converting ${1}"

    mkvmerge -o "${_temp}" "${_orig}" && \
    move "${_temp}" "${_new%.*}.mkv"
}

vid_to_mkv() {
    local _orig _temp
    _orig="${1}"
    _temp="temp_${_orig%.*}.mkv" # remove extension
    _temp2="temp_${_temp}"
    _new="new_${_orig%.*}.mkv"

    log "converting ${1}"

    ffmpeg -i  "${_orig}" -codec:v copy -codec:a copy  "${_temp}" && \
    mkvmerge -o "${_temp2}" "${_temp}"  && \
    remove "${_temp}"  && \
    move "${_temp2}" "${_new}"
}

remove() {
    local _file
    _file="${1}"

    log "removing ${_file}"
    rm -v "${_file}"
}

move() {
    local _orig _temp
    _temp="${1}"
    _orig="${2}"

    log "renaming ${_temp} to ${_orig}"
    mv -v "${_temp}" "${_orig}"
}

file_is_mkv() {
    local _ext
    _ext="${1##*.}"
    if test ${_ext} == "mkv"
    then
        true
    else
        false
    fi
}

main() {
    if test -f "${1}"
    then
        if file_is_mkv "${1}"
        then
            mkv_to_mkv "${1}"
            notify "conversion of ${1} finished"
        else
            vid_to_mkv "${1}"
            notify "conversion of ${1} finished"
        fi
    else
        log "${1} doesn't exist!"
    fi
}


notify() {
    local desc="${1}"
    notify-send -a test -t 6000 -i /usr/local/share/icons/elementary/devices/128/media-optical.svg vid2mkv.sh
}

main "${@}"

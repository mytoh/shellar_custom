#!/bin/sh

ARGS="${@}"
readonly ARGS

unarchive::untar() {
    local file
    file="${1}"

    tar xvf "${file}"
}

main() {
    local file
    file="${1}"

    if test -f "${file}"
    then
        case "${file}" in
            *.tar.bz2)
                unarchive::untar "${file}"
                ;;
            *.tar.gz)
                unarchive::untar "${file}"
                ;;
            *.tar.xz)
                unarchive::untar "${file}"
                ;;
            *.tar)
                unarchive::untar "${file}"
                ;;
            *.tbz2)
                unarchive::untar "${file}"
                ;;
            *.tgz)
                unarchive::untar "${file}"
                ;;
            *.txz)
                unarchive::untar "${file}"
                ;;
            *.xz)
                unxz "${file}"
                ;;
            *.bz2)
                bunzip2 "${file}"
                ;;
            *.rar)
                unrar x "${file}"
                ;;
            *.gz)
                gunzip "${file}"
                ;;
            *.zip)
                unzip "${file}"
                ;;
            *.Z)
                uncompress "${file}"
                ;;
            *.7z)
                7z x "${file}"
                ;;
            *)
                echo "'${file}' cannot be extracted !"
        esac
    else
        echo "'${file}' is not a valid archive"
    fi
}

main "${ARGS}"

#!/bin/sh

ARGS="${@}"
readonly ARGS

archive::tar_xz() {
    local out orig
    out="${1}.tar.xz"
    orig="${1}"
    tar --create --xz --verbose --file "${out}" "${orig}"
}

archive::tar_bz2() {
    local out orig
    out="${1}.tar.bz2"
    orig="${1}"
    tar --create --bzip2 --verbose --file "${out}" "${orig}"
}

archive::tar_gz() {
    local out orig
    out="${1}.tar.gz"
    orig="${1}"
    tar --create --gunzip --verbose --file "${out}" "${orig}"
}

archive::tar() {
    local out orig
    out="${1}.tar"
    orig="${1}"
    tar --create --verbose --file "${out}" "${orig}"
}


archive::7z() {
    local out orig
    out="${1}.7z"
    orig="${1}"
    7z a "${out}" "${orig}"
}

archive::rar() {
    local out orig
    out="${1}.rar"
    orig="${1}"
    rar a "${out}" "${orig}"
}


archive::main() {
    local atype dir
    atype="${1}"
    dir="${2}"

    if test -e "${dir}"
    then
        case "${atype}" in
            tar.bz2)
                archive::tar_bz2 "${dir}" ;;
            tbz2)
                archive::tar_bz2 "${dir}" ;;
            tar.gz)
                archive::tar_gz "${dir}" ;;
            tgz)
                archive::tar_gz "${dir}" ;;
            tar.xz)
                archive::tar_xz "${dir}" ;;
            txz)
                archive::tar_xz "${dir}" ;;
            tar)
                archive::tar "${dir}" ;;
            rar)
                archive::rar "${dir}" ;;
            7z)
                archive::7z "${dir}" ;;
            *)
                echo "'${dir}' cannot be extracted !"
        esac
    else
        echo "'${dir}' is not a valid archive"
    fi
}

archive::main ${ARGS}

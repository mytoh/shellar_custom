#!/bin/sh

set -o nounset
set -o errexit

rebuild_run_deps() {
    local dir depends p
    dir="/usr/ports/${1}"
    depends="$(make -C ${dir} run-depends-list)"

    for p in ${depends}
    do
        sudo make -s -C ${p} clean reinstall clean distclean
    done
}

rebuild_all_deps() {
    local dir depends p
    dir="/usr/ports/${1}"
    depends="$(make -C ${dir} all-depends-list)"

    for p in ${depends}
    do
        sudo make -s -C ${p} reinstall clean distclean
    done
}

rebuild_build_deps() {
    local dir depends p
    dir="/usr/ports/${1}"
    depends="$(make -C ${dir} build-depends-list)"

    for p in ${depends}
    do
        sudo make -s -C ${p} reinstall clean distclean
    done
}

rebuild_one() {
    local dir="/usr/ports/${1}"

    sudo make -s -C ${dir} clean reinstall clean distclean
}

main() {
    local command target
    command="${1}"
    target="${2}"
    case ${command} in
        run)
            rebuild_run_deps "${target}"
            rebuild_one "${target}" ;;
        build)
            rebuild_build_deps "${target}"
            rebuild_one "${target}" ;;
        all)
            rebuild_all_deps "${target}"
            rebuild_one "${target}" ;;
        one)
            rebuild_one "${target}" ;;
    esac
}

main "$@"

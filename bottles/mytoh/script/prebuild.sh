#!/bin/sh

# set -o errexit

ARGS="${@}"
readonly ARGS
NARGS="${#}"
readonly NARGS

command_make() {
    command sudo make -s ${@}
}

rebuild_run_deps() {
    local dir depends p
    if test ${NARGS} -ge 2
    then
        dir="/usr/ports/${1}"
        depends="$(make -C ${dir} run-depends-list)"

        for p in ${depends}
        do
            command_make  -C ${p} clean reinstall clean distclean
        done
    else
        depends="$(make run-depends-list)"

        for p in ${depends}
        do
            command_make  -C ${p} clean reinstall clean distclean
        done
    fi
}

rebuild_all_deps() {
    local dir depends p

    if test ${NARGS} -ge 2
    then
        dir="/usr/ports/${1}"
        depends="$(make -C ${dir} all-depends-list)"

        for p in ${depends}
        do
            command_make -C ${p} reinstall clean distclean
        done
    else
        depends="$(make all-depends-list)"

        for p in ${depends}
        do
            command_make -C ${p} reinstall clean distclean
        done

    fi
}

rebuild_build_deps() {
    local dir depends p

    if test ${NARGS} -ge 2
    then
        dir="/usr/ports/${1}"
        depends="$(make -C ${dir} build-depends-list)"

        for p in ${depends}
        do
            command_make  -C ${p} reinstall clean distclean
        done
    else
        depends="$(make build-depends-list)"

        for p in ${depends}
        do
            command_make  -C ${p} reinstall clean distclean
        done
    fi

}

rebuild_one() {
    local dir
    if test ${NARGS} -ge 2
    then
        dir="/usr/ports/${1}"

        command_make  -C ${dir} clean reinstall clean distclean
    else
        command_make clean reinstall clean distclean
    fi
}

main() {
    local command target

    if test ${NARGS} -ge 2
    then
        command="${1}"
        target="${2}"
        case "${command}" in
            run)
                rebuild_run_deps "${target}"
                rebuild_one "${target}"
                ;;
            build)
                rebuild_build_deps "${target}"
                rebuild_one "${target}"
                ;;
            all)
                rebuild_all_deps "${target}"
                rebuild_one "${target}"
                ;;
            one)
                rebuild_one "${target}"
                ;;
        esac
    else
        command="${1}"
        case "${command}" in
            run)
                rebuild_run_deps
                rebuild_one
                ;;
            build)
                rebuild_build_deps
                rebuild_one
                ;;
            all)
                rebuild_all_deps
                rebuild_one
                ;;
            one)
                rebuild_one
                ;;
        esac
    fi
}

main ${ARGS}

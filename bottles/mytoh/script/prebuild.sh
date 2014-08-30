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
    local portsdir dir depends p
    if test ${NARGS} -ge 2
    then
        portsdir="$(make -f /usr/share/mk/bsd.port.mk -V PORTSDIR)"
        dir="${portsdir}/${1}"
        depends="$(make -C ${dir} run-depends-list)"

        for p in ${depends}
        do
            command_make  -C ${p} clean reinstall clean
        done
    else
        depends="$(make run-depends-list)"

        for p in ${depends}
        do
            command_make  -C ${p} clean reinstall clean
        done
    fi
}

rebuild_all_deps() {
    local portsdir dir depends p

    if test ${NARGS} -ge 2
    then
        portsdir="$(make -f /usr/share/mk/bsd.port.mk -V PORTSDIR)"
        dir="${portsdir}/${1}"
        depends="$(make -C ${dir} all-depends-list)"

        for p in ${depends}
        do
            command_make -C ${p} reinstall clean
        done
    else
        depends="$(make all-depends-list)"

        for p in ${depends}
        do
            command_make -C ${p} reinstall clean
        done

    fi
}

rebuild_build_deps() {
    local portsdir dir depends p

    if test ${NARGS} -ge 2
    then
        portsdir="$(make -f /usr/share/mk/bsd.port.mk -V PORTSDIR)"
        dir="${portsdir}/${1}"
        depends="$(make -C ${dir} build-depends-list)"

        for p in ${depends}
        do
            command_make  -C ${p} reinstall clean
        done
    else
        depends="$(make build-depends-list)"

        for p in ${depends}
        do
            command_make  -C ${p} reinstall clean
        done
    fi

}

rebuild_one() {
    local portsdir dir
    if test ${NARGS} -ge 2
    then
        portsdir="$(make -f /usr/share/mk/bsd.port.mk -V PORTSDIR)"
        dir="${portsdir}/${1}"

        command_make  -C ${dir} clean reinstall clean
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

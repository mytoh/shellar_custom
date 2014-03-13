#!/bin/sh

## https://gist.github.com/7984374.git

optimage::help() {
    echo "Usage: `basename $0` FILE [FILE...]"
    exit 1
}

optimage::png() {
    optipng "${1}"
}

optimage::jpeg() {
    local file opted
    file="${1}"
    opted="${file}.optimized"
    echo "${file}"
    jpegtran "${file}" > "${opted}"
    rm "${file}"
    mv "${opted}" "${file}"

}


optimage::optimize() {
    for f in "$@"; do
        local ext
        ext=${f##*.} # get file extension
        case "${ext}" in
            png)
                optimage::png "${f}" ;;
            jpg|jpeg)
                optimage::jpeg "${f}" ;;
            *)
                echo "not supported format"
        esac
    done
}

optimage::main() {
    if [ $# -lt 1 ]; then
        optimage::help
    fi

    if [ $# -gt 1 ]; then
        # Apparently some builtin echos haet -n.
        echo "$# files specified"
    fi

    optimage::optimize "$@"
}

optimage::main "$@"

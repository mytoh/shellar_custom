#!/bin/sh

get_html() {
    local num orig
    num="${1}"
    orig="SS${num}.orig"

    fetch -o ${orig} "http://nagatoyuki.info/?SS%BD%B8%2F${num}"
}

convert() {
    local num orig html
    num="${1}"
    orig="SS${num}.orig"
    html="SS${num}.html"

    nkf -w ${orig} > ${html}
    rm ${orig}

    pandoc -f html -t org ${html} > SS${num}.org
}

remove_space() {
    local num org sedf
    num="${1}"
    org="SS${num}.org"
    sedf="SS${num}.org.seded"

    gsed -E 's/\s+$//g'  ${org} > ${sedf}

    rm ${org}
    mv ${sedf} ${org}
}

is_exists() {
    local file
    file="${1}"
    test -e ${file}
}

main() {
    local num
    for num in $(seq 1 1200)
    do
        if ! is_exists SS${num}.html
        then
            get_html ${num}
            convert ${num}
            remove_space ${num}
        fi
    done
}

main

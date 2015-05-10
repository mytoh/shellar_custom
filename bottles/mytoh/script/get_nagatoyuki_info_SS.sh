#!/bin/sh

get_html() {
    local num orig
    num="${1}"
    orig="SS${num}.orig"

    if ! is_exists "${orig}"
    then
        printf "get %s\n" "${name}"
        aria2c --out="${orig}" --quiet=true "http://nagatoyuki.info/?SS%BD%B8%2F${num}"
    fi
}

convert_to_org() {
    local num orig html
    num="${1}"
    orig="SS${num}.orig"
    html="SS${num}.html"

    printf "convert %s\n" "${name}"
    nkf -w "${orig}" > "${html}"
    rm "${orig}"

    pandoc --standalone --smart --no-wrap -f html -t org "${html}" -o "SS${num}.org"
}

remove_space() {
    local num org sedf
    num="${1}"
    org="SS${num}.org"
    sedf="SS${num}.org.seded"

    gsed -E 's/\s+$//g'  "${org}" > "${sedf}"

    rm "${org}"
    mv "${sedf}" "${org}"
}

remove_trailing_backslash() {
    local num org sedf
    num="${1}"
    org="SS${num}.org"
    sedf="SS${num}.org.seded"

    gsed -E 's/[\\][\\]$//g' "${org}" > "${sedf}"

    rm "${org}"
    mv "${sedf}" "${org}"
}

remove_tag() {
    local num org
    num="${1}"
    org="SS${num}.org"

    perl -p -i -0 -e 's/#\+BEGIN_HTML\n.+?\n#\+END_HTML//g' "${org}"
}

# remove_tag() {
#     local num org sedf
#     num="${1}"
#     org="SS${num}.org"
#     sedf="SS${num}.org.seded"

#     #gsed -E '/#\+BEGIN_HTML/{N;N;s/#\+BEGIN_HTML.+?#\+END_HTML//}' ${org} > ${sedf}
#     perl -p -i -0 -e 's/#\+BEGIN_HTML\n.+?\n//g' ${org}

#     rm ${org}
#     mv ${sedf} ${org}
# }

is_exists() {
    local file
    file="${1}"
    test -e "${file}"
}

main() {
    local num
    for num in $(seq 1 1300)
    do
        get_html "${num}"
        convert_to_org "${num}"
        # remove_space "${num}"
        remove_trailing_backslash "${num}"
        remove_tag "${num}"
    done
}

main

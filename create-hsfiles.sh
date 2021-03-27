#!/usr/bin/env sh

## Change to the directory of templated files:
cd "${1}" || exit 1

## List files and operate on each:
find . -type f | sort | while read -r _file; do
    ## Get the basename of the file:
    _name="$(echo "${_file}" | sed "s/^.\///g")"

    ## Start the file section:
    printf "{-# START_FILE %s #-}\n" "${_name}"

    ## Put file contents to the file section:
    cat "${_file}"

    ## Add a final newline:
    echo ""
done

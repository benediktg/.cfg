#!/bin/bash
mv-extension()
{
    if (( $# != 2 )); then
        return 1
    fi
    for i in *.$1; do
        mv "$i" "${i%%.$1}.$2"
    done
}

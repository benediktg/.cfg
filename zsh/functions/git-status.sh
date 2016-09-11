#!/bin/bash

gstb() {
    if (( $# != 1 )); then
        return 1
    fi
    local cb
    cb="$(git currentbranch)"
    git checkout -q "$1"
    git status
    git checkout -q "$cb"
}


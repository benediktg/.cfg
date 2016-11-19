#!/bin/bash

gsdst()
{
    for i in $(find -type d -name '.git'); do
        cd "$i/.."
        echo "--------------------\n\n$PWD\n"
        git fetch
        git status --porcelain
        cd "$OLDPWD"
    done
}

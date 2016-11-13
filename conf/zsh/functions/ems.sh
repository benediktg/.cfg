#!/bin/bash

ems()
{
    if [[ $(pgrep -x emacs) == "" ]]; then
        emacs
    else
        emacsclient -c
    fi
}

#!/bin/bash

q()
{
	if [[ -z "$*" ]]; then
		echo "missing argument"
		return 1
	fi
	$("$@" &> /dev/null &)
	return 0
}

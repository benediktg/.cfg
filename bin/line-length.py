#!/usr/bin/env python3

import fileinput
import sys
import os

LOWER = 100
UPPER = 120


def processLine(line, lower, upper):
    line = line[:-1]
    length = len(line)
    isInInterval = (length > lower) and (length <= upper)
    if isInInterval:
        print('{} +{}  {}'.format(fileinput.filename(), fileinput.filelineno(),
                                  line.strip()))


def main():
    lower = int(os.getenv('LLL', default=LOWER))
    upper = int(os.getenv('ULL', default=UPPER))
    with fileinput.input() as f:
        for line in f:
            processLine(line, lower, upper)

if __name__ == '__main__':
    try:
        main()
    except(KeyboardInterrupt):
        print('aborted')

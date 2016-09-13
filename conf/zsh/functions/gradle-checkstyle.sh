#!/bin/bash

gradle-checkstyle ()
{
    printf "Main: %3d\n" "$(./gradlew checkstyleMain --rerun-tasks 2>&1 | ack "ant:checkstyle" | wc -l)" 
    printf "Test: %3d\n" "$(./gradlew checkstyleTest --rerun-tasks 2>&1 | ack "ant:checkstyle" | wc -l)" 
}


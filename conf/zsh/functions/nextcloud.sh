#!/bin/bash

version_gt()
{
    [[ "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" != "$1" ]]
}

nextcloud-install()
{
    if (( $# != 1 )); then
        echo "please provide the version number"
        return 1
    fi

    local WWWUSER="www-data"
    local NCCOL="/var/www/nextcloud.d"
    local NCLNK="/var/www/nextcloud"
    local NCVER="$NCCOL/version.txt"
    local APPDIR="$NCCOL/custom-apps.d"
    local NCCONF="$NCCOL/config.php"

    local PRVDIR="$PWD"
    local NCDIR="nextcloud-$1"
    local NCTAR="$NCDIR.tar.bz2"
    local NCSHA="$NCTAR.sha256"
    local NCASC="$NCTAR.asc"

    if ! version_gt "$1" "$(cat "$NCVER")"; then
        echo "no update necessary, proceed? [Y|n]"
        IFS= read -r k
        [[ "$k" = "n" ]] && return 0 
    fi

    cd "$(mktemp -d)" || return 1
    wget -qO- "https://nextcloud.com/nextcloud.asc" | gpg --import
    for i in "$NCTAR" "$NCSHA" "$NCASC"; do
        wget -q "https://download.nextcloud.com/server/releases/$i"
    done
    sha256sum -c "$NCSHA"
    gpg --verify "$NCASC"
    local tartopdir
    tartopdir="$(tar tf "$NCTAR" | head -n1 | cut -d'/' -f1)"
    tar xf "$NCTAR"
    for i in "$APPDIR"/*; do
        ln -s "$i" "$tartopdir"/apps/
    done
    ln -sf "$NCCONF" "$tartopdir"/config/config.php
    chown "$WWWUSER":"$WWWUSER" -R "$tartopdir"
    [[ -d "$NCCOL"/"$NCDIR" ]] && rm -r "${NCCOL:?}"/"$NCDIR"
    mv "$tartopdir" "$NCCOL"/"$NCDIR"

    [[ -d "$NCLNK" ]] && rm -ri "$NCLNK"
    ln -sf "$NCCOL"/"$NCDIR" "$NCLNK"
    echo "$1" > "$NCVER"
    chown "$WWWUSER":"$WWWUSER" -R "$NCLNK"

    cd "$PRVDIR" || return 1
    return 0
}

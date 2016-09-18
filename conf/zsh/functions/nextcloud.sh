#!/bin/bash

version_gt()
{
    [[ "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" != "$1" ]]
}

export WWWUSER="www-data"
export NCCOL="/var/www/nextcloud.d"
export NCLNK="/var/www/nextcloud"
export NCVER="$NCCOL/version.txt"
export NCAPPDIR="$NCCOL/custom-apps.d"
export NCCONF="$NCCOL/config.php"

nextcloud-install()
{
    if (( $# != 1 )); then
        echo "please provide the version number"
        return 1
    fi

    if ! version_gt "$1" "$(<"$NCVER")"; then
        echo "no update necessary, proceed? [Y|n]"
        IFS= read -r k
        [[ "$k" = "n" ]] && return 0 
    fi

    local prvdir="$PWD"
    local ncdir="nextcloud-$1"
    local nctar="$ncdir.tar.bz2"
    local ncsha="$nctar.sha256"
    local ncasc="$nctar.asc"
    cd "$(mktemp -d)" || return 1
    wget -qO- "https://nextcloud.com/nextcloud.asc" | gpg --import
    for i in "$nctar" "$ncsha" "$ncasc"; do
        wget -q "https://download.nextcloud.com/server/releases/$i"
    done
    sha256sum -c "$ncsha"
    gpg --verify "$ncasc"
    local tartopdir
    tartopdir="$(tar tf "$nctar" | head -n1 | cut -d'/' -f1)"
    tar xf "$nctar"
    for i in "$NCAPPDIR"/*; do
        ln -s "$i" "$tartopdir/apps/"
    done
    ln -sf "$NCCONF" "$tartopdir"/config/config.php
    chown "$WWWUSER:$WWWUSER" -R "$tartopdir"
    [[ -d "$NCCOL/$ncdir" ]] && rm -r "${NCCOL:?}/$ncdir"
    mv "$tartopdir" "$NCCOL"/"$ncdir"

    [[ -d "$NCLNK" ]] && rm -ri "$NCLNK"
    ln -sf "$NCCOL/$ncdir" "$NCLNK"
    echo "$1" > "$NCVER"
    chown "$WWWUSER:$WWWUSER" -R "$NCLNK"

    cd "$prvdir" || return 1
    return 0
}

nextcloud-show-remaining-installed-apps()
{
    if ! [[ -f "$NCVER" ]]; then
        echo "you first must install a nextcloud release"
        return 1
    fi

    local prvdir="$PWD"
    cd "$(mktemp -d)" || return 1
    local nctar="nextcloud-$(<"$NCVER").tar.bz2"
    wget -q "https://download.nextcloud.com/server/releases/$nctar"
    local tartopdir
    tartopdir="$(tar tf "$nctar" | head -n1 | cut -d'/' -f1)"
    tar xf "$nctar"
    find "$tartopdir/apps" -maxdepth 1 | cut -d'/' -f3 | sort > default-apps.txt
    find "$NCAPPDIR" -mindepth 1 -maxdepth 1 -type d | cut -d'/' -f6 | sort > custom-apps.txt
    find "$NCLNK/apps" -maxdepth 1 | cut -d'/' -f6 | sort > all-apps.txt
    diff all-apps.txt default-apps.txt | ack "^< " | cut -d' ' -f2 > installed-apps.txt
    diff installed-apps.txt custom-apps.txt | ack "^< " | cut -d' ' -f2

    cd "$prvdir" || return 1
    return 0
}

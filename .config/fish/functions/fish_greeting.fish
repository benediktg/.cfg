function fish_greeting
    set -qU _motd_printed_date; or set -l _motd_printed_date
    set -l today (date +"%Y-%m-%d")

    test "$_motd_printed_date" != "$today"
    and cat /etc/motd

    set -U _motd_printed_date $today
end

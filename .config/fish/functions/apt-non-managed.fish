function apt-non-managed
    set -x LC_ALL C
    comm -23 \
       (sudo find /etc -xdev -type f | sort | psub) \
       (sort -u /var/lib/dpkg/info/*.list | psub)
end

function apt-changed-file
    dpkg-query -W -f='${Conffiles}\n' '*' | \
       awk 'OFS="  "{print $2,$1}' | \
       LANG=C md5sum -c 2>/dev/null | \
       awk -F': ' '$2 !~ /OK$/{print $1}' | \
       sort
end

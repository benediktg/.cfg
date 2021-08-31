function extract-tex-toc
rg '\{\\\numberline \{[0-9]' $argv.toc |\
string split -m1 -f2 '\\numberline {' |\
cut -d'}' -f1-2 |\
string replace '}' ' ' \
> table-of-contents.txt
end

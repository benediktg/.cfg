function bw-sort
    bw list items | jq -r '
        map(. + { e: (.revisionDate | sub(".[0-9]+Z$"; "Z") |
            strptime("%Y-%m-%dT%H:%M:%SZ") | mktime), d: (.revisionDate[0:10]) }) |
            sort_by( -(.e)) | .[] | .name + " (" + .d + ")"
    '
end

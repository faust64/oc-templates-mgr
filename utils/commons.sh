#!/bin/sh

fetch_template()
{
    local project template
    if test "$2"; then
	project="$1"
	shift
    else
	project=openshift
    fi
    if test "$1"; then
	template="$1"
	shift
    else
	template=jenkins-persistent
    fi
    test -z "$EXPORT_FILTERS" && EXPORT_FILTERS="creationTimestamp="
    oc export template -n "$project" "$template" | grep -vE "$EXPORT_FILTERS"
}

#thanks to SO:
# -- https://stackoverflow.com/questions/5014632/how-can-i-parse-a-yaml-file-from-a-linux-shell-script
parse_yaml()
{
    local s w fs prefix s
    prefix=$2
    s='[[:space:]]*'
    w='[a-zA-Z0-9_]*'
    fs=`echo @|tr @ '\034'`
    sed -ne "s|^\($s\):|\1|" \
	-e "s|^\($s\)\($w\)$s:$s[\"']\(.*\)[\"']$s\$|\1$fs\2$fs\3|p" \
	-e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p" "$1" |
	awk "-F$fs" '{
		indent = length($1)/2
		vname[indent] = $2
		for (i in vname) {
		    if (i > indent) { delete vname[i] }
		}
		if (length($3) > 0) {
		    vn=""
		    for (i=0; i<indent; i++) {
			vn=(vn)(vname[i])("_")
		    }
		    printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3)
		}
	}'
}

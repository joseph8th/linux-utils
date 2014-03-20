#!/usr/bin/env bash

function _print_help {
    echo 'Usage: sort_ext SRC DEST'; exit 1
}


#### MAIN section ####

[[ "$#" < "2" ]] && _print_help

SRC=$1
DEST=$2

if [[ ! -e "$SRC" ]]; then
    echo "==> ERROR: '${SRC}' not found."; exit 1
fi
if [[ -e "$DEST" ]]; then
    echo "==> ERROR: '${DEST}' already exists."; exit 1
fi

# so far no recursion into subdirs - OK for 'photorec'
fcount=extcount=0

echo "Processing '$1' ..."

for dir in $(ls -d $SRC/*); do
    for f in $(ls $dir); do
	base=$(basename $f)
	ext=$(echo "$f"|awk -F . '{print $NF}')
	[[ "$base" == "$ext" ]] && ext="none"

	dest_ext="${DEST}/${ext}"
	[[ ! -e "$dest_ext" ]] && mkdir -p "$dest_ext" && (( extcount++ ))

	src_path="${dir}/${f}"
	cp "$src_path" "$dest_ext"
	(( fcount++ ))
    done
done

echo "==> DONE: copied (${fcount}) files to (${extcount}) extension directories."


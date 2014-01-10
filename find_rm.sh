#!/usr/bin/env bash

function _print_help {
    echo 'Usage: find_rm DIRECTORY "NAME"'; exit 1
}

[[ "$#" < "2" ]] && _print_help

if [[ ! -e "$1" ]]; then
    echo "==> ERROR: '${$1}' not found."; exit 1
fi

DIR=$1
NAME=$2

OLDIFS=$IFS
IFS=$'\n'
fileAry=($(find $DIR -name "$2"))
IFS=$OLDIFS

echo "FOUND by NAME ..."; echo

fLen=${#fileAry[@]}
for (( i=0; i<${fLen}; i++ ));
do
    echo "${fileAry[$i]}"
done

echo; read -p "Are you sure you want to PERMANENTLY DELETE these files? [y/N]: " choice
while true
do
    case $choice in
	[yY]* )
	    for (( i=0; i<${fLen}; i++ )); do
		rm -f "${fileAry[$i]}"
	    done
	    break
	    ;;
	* )
	    echo "Cancelled."
	    exit
	    ;;
    esac
done

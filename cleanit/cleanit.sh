#!/usr/bin/env bash

#### 'local' function defs ####

function _print_help {
    echo 'Usage: cleanit [-d DIRECTORY] [-t] [-p] [-h]'
    printf "\t-d\tDIRECTORY to clean\n\t-t\tcleanup 'testdisk'\n\t-p\tcleanup 'photorec'\n"
    exit 1
}


function _clean_testdisk {

    junkAry=( "*:*" "Thumbs.db" "Desktop.ini" )

    for junk in $junkAry; do
	exec ./find_rm.sh "$1" "$junk"
    done
}


#### MAIN section ####

DIR="$PWD"
flags=""

while getopts ":d:tph" opt; do
    case "$opt" in
	d)
	    DIR="$OPTARG"
	    if [[ ! -e "$DIR" ]]; then
		echo "==> ERROR: '${DIR}' not found." >&2; exit 1
	    fi
	    ;;
	t|p)
	    flags="$opt $flags"
	    ;;
	h)
	    _print_help
	    ;;
	\?)
	    echo "Invalid option: -$OPTARG" >&2
	    _print_help
	    ;;
	*)
	    _print_help;;
    esac
done

echo "Cleaning '${DIR}' ..."
for flag in $flags; do
    case $flag in
	t)
	    echo "Attempting to clean up 'testdisk' files ..."
	    _clean_testdisk "$DIR"
	    ;;
	p)
	    echo "Attempting to clean up 'photorec' files ..."
	    ;;
	
    esac
done

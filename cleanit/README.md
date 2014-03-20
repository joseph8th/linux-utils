CleanIt
=======

Data recovery utility scripts to find and remove large numbers of files, and organize them.

cleanit.sh
----------

Automates some cleanup after `testdisk` or `photorec` data recovery using included scripts.

### Usage

    cleanit.sh [-h] [-t | -p] [-d DIRECTORY]

### Options

    -t	removes files '*:*', 'Thumbs.db', and 'Desktop.ini' from 'testdisk' copies
    -p	copies files from generic 'photorec' tree into a tree organized by extension

find_rm.sh
----------

Interactive removal of any number of files using `find -name` below given directory.

### Usage

    find_rm.sh DIRECTORY "NAME"

sort_ext.sh
-----------

Copies files from a given set of subdirectories into directories sorted by extension name.

### Usage

    sort_ext.sh SRC DEST

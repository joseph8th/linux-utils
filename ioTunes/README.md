ioTunes
=======

Simple bash script to convert iTunes music library from .m4a to .mp3, preserving playlists and metadata.

How 'ioTunes' works: the user provides an 'iTunes' directory containing an `iTunes Music Library.xml` file and `iTunes Music` directory, and an output path (i.e., to your `~/Music` directory). ioTunes then creates a new directory tree called `oTunes` in your output path. Your mp3 files are organized in subdirectories by genre, musician, and album. Your playlists are symbolic links to files in your new `oTunes/Music` directory.

Requirements
------------

faad - Process an Advanced Audio Codec stream
lame - create mp3 audio files

Usage
-----

    ioTunes [input path] [output path]

where the input path is to the iTunes directory containing 'iTunes Music Library.xml'

Example
-------

    $ ioTunes /path/to/iTunes /path/to/oTunes

Changelog
---------

This script is a more general-purpose fork of [this script](http://code.ecomerc.com/Articles/iTunesConvert/), which was hard-coded for a Synology file sharing drive.

* Changed `#!/bin/sh` to `#!/usr/bin/env bash`
* Added commandline arguments for in-path and out-path
* Commented out synology-specific settings and code
* Added code to create `oTunes/Music` and `oTunes/Playlists` in the out-path directory
* Added code to run faad and lame in a subshell, suppressing verbosity
* Fixed a few bugs with the original version

Known Bugs
----------

* Something wrong with the way the original version uses `printf`
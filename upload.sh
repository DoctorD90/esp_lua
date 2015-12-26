#!/bin/bash

#Path discover
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
	DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
	SOURCE="$(readlink "$SOURCE")"
	[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
cd "$DIR"
echo "$DIR"

for file in *.lua; do
	if [ ! "$file" == "init.lua" ]; then
		luatool -v -p /dev/ttyUSB0 -b 9600 -f "$DIR/$file"
	fi
done

luatool -v -r -p /dev/ttyUSB0 -b 9600 -f "$DIR"/init.lua

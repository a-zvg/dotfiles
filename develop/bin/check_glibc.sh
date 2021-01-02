#!/bin/bash

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <elf>"
    exit
fi

if [ ! -f "$1" ]; then
    echo "$1 not found"
    exit
fi

BIN="$1"

# Get the max major version, then find the max minor version for that major
MAX_MAJOR_VER="$(objdump -T "$BIN" | sed -n 's/.*GLIBCXX_\([0-9]\.[0-9]\+\).*$/\1/p' | cut -f 1 -d '.' | sort -g | tail -n 1)"
MAX_MINOR_VER="$(objdump -T "$BIN" | grep GLIBCXX_$MAX_MAJOR_VER | sed -n 's/.*GLIBCXX_\([0-9]\.[0-9]\+\).*$/\1/p' | cut -f 2 -d '.' | sort -g | tail -n 1)"
MAX_PATCH_VER="$(objdump -T "$BIN" | grep GLIBCXX_$MAX_MAJOR_VER.$MAX_MINOR_VER | sed -n 's/.*GLIBCXX_\([0-9]\.[0-9]\+\.[0-9]\+\).*$/\1/p' | cut -f 3 -d '.' | sort -g | tail -n 1)"
BIN_MAX_VER="$MAX_MAJOR_VER.$MAX_MINOR_VER.$MAX_PATCH_VER"

SYS_MAX_VER="$(cat /usr/lib/x86_64-linux-gnu/libstdc++.so.6 | grep -ao 'GLIBCXX_[0-9]\.[0-9]\+\.[0-9]\+' | sed -n 's/.*GLIBCXX_\([0-9]\.[0-9]\+\.[0-9]\+\).*$/\1/p' | tail -n1)"

echo $1 requires glibc++ version $BIN_MAX_VER
echo system glibc++ version is $SYS_MAX_VER

#!/bin/bash

set -e

SCRIPT_PATH=$(dirname "$(realpath -s "$0")")

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <boost dir> <dst dir> <deps file>"
    exit 1
fi
BOOST_DIR="$1"
DST_DIR="$(realpath -s "$2")"
DEPS=$(cat $3)

pushd "$BOOST_DIR"
"./bootstrap.sh" --show-libraries > /dev/null
"./b2" tools/bcp/ -j`nproc`
[ ! -d "$DST_DIR" ] && mkdir "$DST_DIR"
"./dist/bin/bcp" $DEPS "$DST_DIR"
popd

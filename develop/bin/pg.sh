#!/bin/bash

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 pg_command"
    exit
fi

POSTGRESQL_LIB="$(dirname "$1")/../lib"
export LD_LIBRARY_PATH="$POSTGRESQL_LIB"

"$@"

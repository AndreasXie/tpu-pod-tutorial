#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 <python_file>"
    exit 1
fi

PYTHON_FILE="$1"

eopod kill-tpu --force
eopod run "
export PATH=$PATH &&
cd ~/yutao/tpu-pod-tutorial &&
git pull &&
uv run --prerelease allow $PYTHON_FILE
"
#!/usr/bin/env bash
# loveliveandstantripleS

DIR="${1:-.}"

if [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' does not exist"
    exit 1
fi

cd "$DIR" || exit 1

if [ ! -f "test01" ]; then
    echo "Error: test01 file does not exist"
    exit 1
fi

if [ -s "test01" ]; then
    echo "Error: test01 file is not empty"
    exit 1
fi

if [ ! -f "test02" ]; then
    echo "Error: test02 file does not exist"
    exit 1
fi

content=$(cat test02 2>/dev/null)
if [ "$content" != "If you don't struggle, you don't improve." ]; then
    echo "Error: test02 does not contain the correct content"
    exit 1
fi

perms=$(stat -c "%a" test02)
if [ "$perms" != "755" ]; then
    echo "Error: test02 does not have correct permissions (755)"
    exit 1
fi

if [ ! -L "test03" ]; then
    echo "Error: test03 is not a symbolic link"
    exit 1
fi

link_target=$(readlink test03)
if [ "$link_target" != "test02" ]; then
    echo "Error: test03 does not point to test02"
    exit 1
fi

echo "All conditions are met successfully!"

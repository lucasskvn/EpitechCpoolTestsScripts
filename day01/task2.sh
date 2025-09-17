#!/usr/bin/env bash
# loveliveandstantripleS

TEST_DIR="${1:-.}"

test_z_file_content() {
    output=$(cat "$TEST_DIR/z")
    expected="Z"

    if [ ! -f "$TEST_DIR/z" ]; then
        echo "FAIL: File $TEST_DIR/z does not exist"
        return 1
    fi
    
    if [ "$output" = "$expected" ]; then
        echo "PASS: File z correctly displays 'Z' followed by line feed"
        return 0
    else
        echo "FAIL: File z does not display expected content"
        echo "Expected: '$expected'"
        echo "Got: '$output'"
        return 1
    fi
}

echo "Running test for $TEST_DIR/task02/z file..."
echo "----------------------------------------"
test_z_file_content
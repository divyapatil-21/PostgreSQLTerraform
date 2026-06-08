#!/bin/bash

source "$(dirname "$0")/app-config.sh"

echo "================================="
echo "PRECHECK STARTED"
echo "================================="

if [ "$EUID" -ne 0 ]; then
    echo "ERROR: Run as root or sudo"
    exit 1
fi

echo "Root Check Passed"

if ! command -v psql >/dev/null 2>&1; then
    echo "PostgreSQL Client Not Found"
else
    echo "PostgreSQL Client Found"
fi

echo
echo "PRECHECK PASSED"

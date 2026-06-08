#!/bin/bash

source "$(dirname "$0")/app-config.sh"

echo
echo "================================="
echo "DATABASE CHECK"
echo "================================="
echo

DB_EXISTS=$(sudo -u postgres psql -tAc "SELECT 1 FROM pg_database WHERE datname='$POSTGRES_DB'")

if [ "$DB_EXISTS" = "1" ]; then
    echo "Database Already Exists"
else
    sudo -u postgres psql -c "CREATE DATABASE \"$POSTGRES_DB\";"

    if [ $? -ne 0 ]; then
        echo "ERROR: Database Creation Failed"
        exit 1
    fi

    echo "Database Created"
fi

exit 0

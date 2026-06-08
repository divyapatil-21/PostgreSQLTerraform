#!/bin/bash

source "$(dirname "$0")/app-config.sh"

echo
echo "================================="
echo "DEPLOYMENT VERIFICATION"
echo "================================="
echo

PGPASSWORD="$POSTGRES_PASSWORD" psql \
-h "$POSTGRES_HOST" \
-p "$POSTGRES_PORT" \
-U "$POSTGRES_USER" \
-d "$POSTGRES_DB" \
-c "SELECT COUNT(*) AS customers FROM customers;"

if [ $? -ne 0 ]; then
    echo "ERROR: Verification Failed"
    exit 1
fi

PGPASSWORD="$POSTGRES_PASSWORD" psql \
-h "$POSTGRES_HOST" \
-p "$POSTGRES_PORT" \
-U "$POSTGRES_USER" \
-d "$POSTGRES_DB" \
-c "SELECT COUNT(*) AS products FROM products;"

PGPASSWORD="$POSTGRES_PASSWORD" psql \
-h "$POSTGRES_HOST" \
-p "$POSTGRES_PORT" \
-U "$POSTGRES_USER" \
-d "$POSTGRES_DB" \
-c "SELECT COUNT(*) AS orders FROM orders;"

echo
echo "VERIFICATION SUCCESSFUL"

exit 0

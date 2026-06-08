#!/bin/bash

source "$(dirname "$0")/app-config.sh"

echo
echo "================================="
echo "TABLE CREATION"
echo "================================="
echo

PGPASSWORD="$POSTGRES_PASSWORD" psql \
-h "$POSTGRES_HOST" \
-p "$POSTGRES_PORT" \
-U "$POSTGRES_USER" \
-d "$POSTGRES_DB" \
-f "$PROJECT_ROOT/database/schema/create_tables.sql"

if [ $? -ne 0 ]; then
    echo "ERROR: Table Creation Failed"
    exit 1
fi

echo "Tables Created Successfully"

exit 0

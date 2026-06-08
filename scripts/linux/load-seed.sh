#!/bin/bash

source "$(dirname "$0")/app-config.sh"

echo
echo "================================="
echo "SEED DATA LOAD"
echo "================================="
echo

PGPASSWORD="$POSTGRES_PASSWORD" psql \
-h "$POSTGRES_HOST" \
-p "$POSTGRES_PORT" \
-U "$POSTGRES_USER" \
-d "$POSTGRES_DB" \
-f "$PROJECT_ROOT/database/seed/seed_data.sql"

if [ $? -ne 0 ]; then
    echo "ERROR: Seed Data Load Failed"
    exit 1
fi

echo "Seed Data Loaded Successfully"

exit 0

#!/bin/bash

source scripts/linux/app-config.sh

echo "================================="
echo "POSTGRESQL STATUS CHECK"
echo "================================="
echo

systemctl is-active postgresql

PGPASSWORD="$POSTGRES_PASSWORD" psql \
-h "$POSTGRES_HOST" \
-p "$POSTGRES_PORT" \
-U "$POSTGRES_USER" \
-d "$POSTGRES_DB" \
-c "SELECT current_database();"

echo
echo "SYSTEM READY"

#!/bin/bash

source "$(dirname "$0")/app-config.sh"

echo
echo "================================="
echo "POSTGRESQL CONFIGURATION"
echo "================================="
echo

PG_CONF=$(find /etc/postgresql -name postgresql.conf | head -1)

if [ -z "$PG_CONF" ]; then
    echo "ERROR: postgresql.conf not found"
    exit 1
fi

cp "$PG_CONF" "$PG_CONF.bak"

sed -i "s/^#\?port.*/port = $POSTGRES_PORT/" "$PG_CONF"

systemctl restart postgresql

sleep 5

systemctl is-active --quiet postgresql

if [ $? -ne 0 ]; then
    echo "ERROR: PostgreSQL Service Failed To Start"
    exit 1
fi

echo "PostgreSQL Port Configured: $POSTGRES_PORT"

exit 0

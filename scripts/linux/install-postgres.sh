#!/bin/bash

source "$(dirname "$0")/app-config.sh"

echo
echo "================================="
echo "POSTGRESQL INSTALLATION"
echo "================================="
echo

if command -v psql >/dev/null 2>&1; then
    echo "PostgreSQL Already Installed"
    exit 0
fi

echo "Installing PostgreSQL..."

apt-get update -y
apt-get install -y postgresql postgresql-contrib

if [ $? -ne 0 ]; then
    echo "ERROR: PostgreSQL Installation Failed"
    exit 1
fi

systemctl enable postgresql
systemctl start postgresql

sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '$POSTGRES_PASSWORD';"

if [ $? -ne 0 ]; then
    echo "ERROR: PostgreSQL Password Configuration Failed"
    exit 1
fi

echo "PostgreSQL Installed Successfully"

exit 0

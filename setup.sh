#!/bin/bash

echo "====================================="
echo "PostgreSQL Infrastructure Automation"
echo "====================================="
echo

bash scripts/linux/precheck.sh || exit 1
bash scripts/linux/install-postgres.sh || exit 1
bash scripts/linux/configure-postgres.sh || exit 1
bash scripts/linux/create-db.sh || exit 1
bash scripts/linux/create-tables.sh || exit 1
bash scripts/linux/load-seed.sh || exit 1
bash scripts/linux/verify.sh || exit 1

echo
echo "====================================="
echo "DEPLOYMENT COMPLETED SUCCESSFULLY"
echo "====================================="

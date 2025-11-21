#!/bin/bash

# Load environment variables from .env file
if [ ! -f .env ]; then
    echo ".env file not found!"
    exit 1
fi

set -a
source .env
set +a

# Variables
PROD_BACKUP_FILE="$BACKUP_PATH/prod_backup_$(date +%F_%H-%M).sql"
STAGING_BACKUP_FILE="$BACKUP_PATH/staging_backup_$(date +%F_%H-%M).sql"

# Ensure the backup directory exists
mkdir -p "$BACKUP_PATH"

# Step 1: Backup Production Database
echo "Starting production database backup..."
docker exec "$DB_CONTAINER_NAME" mariadb-dump --single-transaction --routines --events \
  -u"$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" | zstd -T0 -19 -o "${PROD_BACKUP_FILE}.zst"
if [ $? -eq 0 ]; then
  echo "Production database backup completed: ${PROD_BACKUP_FILE}.zst"
else
  echo "Error: Failed to backup production database."
  exit 1
fi

# Step 2: Backup Staging Database
echo "Starting staging database backup..."
docker exec "$STAGING_DB_CONTAINER_NAME" mariadb-dump --single-transaction --routines --events \
  -u"$STAGING_DB_USER" -p"$STAGING_DB_PASSWORD" "$STAGING_DB_NAME" | zstd -T0 -19 -o "${STAGING_BACKUP_FILE}.zst"
if [ $? -eq 0 ]; then
  echo "Staging database backup completed: ${STAGING_BACKUP_FILE}.zst"
else
  echo "Error: Failed to backup staging database."
  exit 1
fi

echo "Both production and staging backups completed successfully."

#!/bin/bash

# Load environment variables from .env file
if [ ! -f .env ]; then
    echo ".env file not found!"
    exit 1
fi

set -a
source .env
set +a

BACKUP_FILE="$1"

# Check if backup file is provided and exists
if [ -z "$BACKUP_FILE" ]; then
  echo "Error: No backup file specified."
  echo "Usage: $0 path/to/backup.sql.gz"
  exit 1
fi

if [ ! -f "$BACKUP_FILE" ]; then
  echo "Error: Backup file not found: $BACKUP_FILE"
  exit 1
fi

# Detect compression
if [[ "$BACKUP_FILE" == *.gz ]]; then
  echo "Decompressing and restoring database from gzip file..."
  gzip -dc "$BACKUP_FILE" | docker exec -i "$DB_CONTAINER_NAME" mariadb -u"$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" --force
else
  echo "Restoring database from uncompressed SQL file..."
  docker exec -i "$DB_CONTAINER_NAME" mariadb -u"$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" --force < "$BACKUP_FILE"
fi

if [ $? -eq 0 ]; then
  echo "Database restoration completed successfully."
else
  echo "Error occurred during database restoration."
  exit 1
fi

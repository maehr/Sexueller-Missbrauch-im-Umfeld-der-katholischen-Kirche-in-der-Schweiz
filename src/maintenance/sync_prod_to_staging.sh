#!/bin/bash

# Load environment variables from .env file
if [ ! -f .env ]; then
    echo ".env file not found!"
    exit 1
fi

set -a
source .env
set +a

# Step 1: Stop Production Docker Compose
echo "Stopping production Docker Compose..."
docker-compose -f docker-compose.prod.yml down
if [ $? -ne 0 ]; then
  echo "Error: Failed to stop production Docker Compose."
  exit 1
fi
echo "Production Docker Compose stopped."

# Step 2: Copy DB data inside Docker
echo "Copying DB volume contents via temporary container..."
docker run --rm \
  -v "$(pwd)/db_data:/from:ro" \
  -v "$(pwd)/staging_db_data:/to" \
  alpine sh -c "rm -rf /to/* && cp -a /from/. /to/"
if [ $? -ne 0 ]; then
  echo "Error: Failed to copy DB volume inside Docker."
  exit 1
fi
echo "DB volume contents copied."

# Step 3: Copy MediaWiki images inside Docker
echo "Copying MediaWiki image volume contents via temporary container..."
docker run --rm \
  -v "$(pwd)/mediawiki_images:/from:ro" \
  -v "$(pwd)/staging_mediawiki_images:/to" \
  alpine sh -c "rm -rf /to/* && cp -a /from/. /to/"
if [ $? -ne 0 ]; then
  echo "Error: Failed to copy MediaWiki images inside Docker."
  exit 1
fi
echo "MediaWiki images copied."

# Step 4: Restart Production Docker Compose
echo "Restarting production Docker Compose..."
docker-compose -f docker-compose.prod.yml up -d
if [ $? -ne 0 ]; then
  echo "Error: Failed to restart production Docker Compose."
  exit 1
fi
echo "Production Docker Compose restarted successfully."

echo "Sync from production to staging completed."

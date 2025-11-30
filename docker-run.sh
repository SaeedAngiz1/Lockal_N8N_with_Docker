#!/bin/bash

# n8n Docker Run Script
# This script provides an alternative way to run n8n using docker run command

# Default values
TIMEZONE="${GENERIC_TIMEZONE:-America/New_York}"
CONTAINER_NAME="n8n"
PORT="5678:5678"
VOLUME_NAME="n8n_data"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting n8n with Docker...${NC}"
echo -e "${YELLOW}Timezone: ${TIMEZONE}${NC}"
echo -e "${YELLOW}Container Name: ${CONTAINER_NAME}${NC}"
echo -e "${YELLOW}Port: ${PORT}${NC}"
echo ""

# Check if .env file exists and load it
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
    echo "Loaded environment variables from .env file"
fi

# Run the container
docker run -it --rm \
  --name ${CONTAINER_NAME} \
  -p ${PORT} \
  -e GENERIC_TIMEZONE="${GENERIC_TIMEZONE:-${TIMEZONE}}" \
  -e N8N_ENFORCE_SETTING_FILE_PERMISSIONS=true \
  -e N8N_RUNNERS_ENABLED=true \
  -v ${VOLUME_NAME}:/home/node/.n8n \
  docker.n8n.io/n8nio/n8n

echo -e "${GREEN}n8n container stopped.${NC}"


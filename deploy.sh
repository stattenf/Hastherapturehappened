#!/bin/bash

# Hugo Site Deployment Script
# This script builds the Hugo site and deploys it using rsync
# Usage: ./deploy.sh [server_host] [server_user] [server_path]

set -e  # Exit on any error

# Default values (can be overridden by command line arguments)
SERVER_HOST=${1:-"hastherapturehappened.com"}
SERVER_USER=${2:-"stattenfweb"}
SERVER_PATH=${3:-"~/hastherapturehappened.com/"}

echo "Building Hugo site..."
hugo --minify

if [ ! -d "public" ]; then
    echo "Error: Hugo build failed - public directory not found"
    exit 1
fi

echo "Deploying to $SERVER_USER@$SERVER_HOST:$SERVER_PATH"
echo "Press Ctrl+C to cancel, or Enter to continue..."
read

rsync -avzr --delete public/ $SERVER_USER@$SERVER_HOST:$SERVER_PATH

echo "Deployment complete!"
echo "Your site should now be live at: https://$SERVER_HOST"


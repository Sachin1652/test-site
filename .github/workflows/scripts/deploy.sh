#!/bin/bash
set -e

echo "Triggering Amplify deployment..."

curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$AMPLIFY_WEBHOOK"

#!/bin/bash
set -e

echo "Triggering Amplify deployment..."

if [ -z "$AMPLIFY_WEBHOOK" ]; then
  echo "ERROR: AMPLIFY_WEBHOOK is empty!"
  exit 1
fi

echo "Webhook length: ${#AMPLIFY_WEBHOOK}"
echo "Webhook starts with: ${AMPLIFY_WEBHOOK:0:30}"

HTTP_STATUS=$(curl -s -o response.txt -w "%{http_code}" \
  -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$AMPLIFY_WEBHOOK")

echo "HTTP Status: $HTTP_STATUS"
cat response.txt

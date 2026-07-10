#!/bin/bash
set -e

echo "Triggering Amplify deployment..."

HTTP_STATUS=$(curl -s -o response.txt -w "%{http_code}" \
  -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$AMPLIFY_WEBHOOK")

echo "HTTP Status: $HTTP_STATUS"
echo "Response:"
cat response.txt
echo

if [ "$HTTP_STATUS" -ne 200 ]; then
  echo "Amplify deployment trigger failed."
  exit 1
fi

echo "Amplify deployment triggered successfully."

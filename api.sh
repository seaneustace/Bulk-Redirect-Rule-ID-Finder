#!/bin/bash

url="https://api.cloudflare.com/client/v4/accounts/<account_id>/rules/lists/<list_id>/items?cursor="
email="user@example.com"
key="apikeyhere"
cursor=""
userURL=""

echo Sean\'s Bulk Redirect Item Finder v2.3
read -p 'Enter a URL to search: ' userURL

while true; do
  response=$(curl -s "$url$cursor" -H "X-Auth-Email: $email" -H "X-Auth-Key: $key")
  if [[ $response == *$userURL* ]]; then
    id=$(echo "$response" | jq -r '.result[0].id')
    echo "Found the item with ID $id"
    break
  fi

  cursor=$(echo "$response" | jq -r '.result_info.cursors.after')
  if [[ $cursor == "null" ]]; then
    echo "Item not found."
    break
  fi
done

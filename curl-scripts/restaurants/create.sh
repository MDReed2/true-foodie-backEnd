#!/bin/bash

API="http://localhost:4741"
URL_PATH="/examples"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "restuarant": {
      "name": "'"${NAME}"'",
      "address": "'"${ADDRESS}"'",
      "cuisine": "'"${CUISINE}"'"
    }
  }'

echo

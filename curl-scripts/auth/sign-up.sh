#!/bin/bash

# EMAIL="mdr@reed.com" PASSWORD="mr" PASSWORD="mr" sh curl-scripts/auth/sign-up.sh
# {"user":{"_id":"619db8bb9e00ec5d49a7263c","email":"m@m.com","createdAt":"2021-11-24T03:59:55.724Z","updatedAt":"2021-11-24T03:59:55.724Z","__v":0}}

API="http://localhost:4741"
URL_PATH="/sign-up"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'

echo

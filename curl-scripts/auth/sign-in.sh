#!/bin/bash

# {"user":{"_id":"619db8bb9e00ec5d49a7263c","email":"m@m.com","createdAt":"2021-11-24T03:59:55.724Z","updatedAt":"2021-12-01T01:36:03.927Z","__v":0,"token":"8f960a021e4024d1b4d1aeb7fb82e1f8"}}

API="http://localhost:4741"
URL_PATH="/sign-in"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'

echo

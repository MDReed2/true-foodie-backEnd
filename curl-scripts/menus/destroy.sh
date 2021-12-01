#!/bin/bash

# TOKEN=8f960a021e4024d1b4d1aeb7fb82e1f8 ID=61a6d86ba3f93ac90e32f24f sh curl-scripts/destinations/destroy.sh

API="http://localhost:4741"
URL_PATH="/menu"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}"

echo

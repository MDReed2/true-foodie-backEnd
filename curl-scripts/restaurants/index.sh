#!/bin/sh

# TOKEN=8f960a021e4024d1b4d1aeb7fb82e1f8 sh curl-scripts/menus/index.sh

API="http://localhost:4741"
URL_PATH="/menu"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo

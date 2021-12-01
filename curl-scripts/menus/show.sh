#!/bin/sh

# TOKEN=8f960a021e4024d1b4d1aeb7fb82e1f8 ID=61a6eba67fb7dacdaea1c180 sh curl-scripts/menus/show.sh

API="http://localhost:4741"
URL_PATH="/menus"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo

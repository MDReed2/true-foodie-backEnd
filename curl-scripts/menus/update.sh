#!/bin/bash

# TOKEN=8f960a021e4024d1b4d1aeb7fb82e1f8 ID=61a6eba67fb7dacdaea1c180 MENU="Pasta" NAME="Four Cheese Pasta" DESCRIPTION="Penne Pasta, Mozzarella, Ricotta, Romano and Parmesan Cheeses, Marinara Sauce and Fresh Basil" CALORIES=1280 PRICE=18.50 sh curl-scripts/menus/update.sh

API="http://localhost:4741"
URL_PATH="/menu"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{
    "menu": {
      "menu": "'"${MENU}"'",
      "name": "'"${NAME}"'",
      "description": "'"${DESCRIPTION}"'",
      "calories": "'"${CALORIES}"'",
      "price": "'"${PRICE}"'"
    }
  }'

echo

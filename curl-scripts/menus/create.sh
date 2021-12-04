#!/bin/bash

# TOKEN=8f960a021e4024d1b4d1aeb7fb82e1f8 MENU="" NAME="TOMATO BASIL PASTA" DESCRIPTION="Grilled Chicken, Fresh Mozzarella, a Touch of Garlic and Penne Pasta. Light and Fresh." CALORIES=1580 PRICE=11.50 sh curl-scripts/menus/create.sh

# TOKEN=8f960a021e4024d1b4d1aeb7fb82e1f8 NAME="Four Cheese Pasta" DESCRIPTION="Penne Pasta, Mozzarella, Ricotta, Romano and Parmesan Cheeses, Marinara Sauce and Fresh Basil" CALORIES=1280 PRICE=18.50 sh curl-scripts/menus/create.sh


API="http://localhost:4741"
URL_PATH="/menu"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "menu": {
      "menu": "'"${CATEGORY}"'",
      "name": "'"${NAME}"'",
      "description": "'"${DESCRIPTION}"'",
      "calories": "'"${CALORIES}"'",
      "price": "'"${PRICE}"'"
    }
  }'

echo

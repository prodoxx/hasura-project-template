#!/bin/bash

# Load the environment variables from the .env file
if [ -f ./.env.docker.preprod ]; then
  source ./.env.docker.preprod
else
  echo "File ./.env.docker.preprod not found"
  exit 1
fi

# Run the hasura console command with the loaded environment variables
hasura console --admin-secret "${HASURA_GRAPHQL_ADMIN_SECRET}" --endpoint "${HASURA_GRAPHQL_ENDPOINT}"

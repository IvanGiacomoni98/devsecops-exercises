#!/usr/bin/env bash
# Creates an Asset (API: product) inside an Organization if it does not exist.
# Asset names are unique across the whole instance.
# Usage:  ./02_asset.sh "<name>" <organization_id> ["<description>"]
# Output: Asset id on stdout (logs on stderr)
set -euo pipefail
source "$(dirname "$0")/common.sh"

NAME=${1:?Asset name is required}
ORG_ID=${2:?Organization id is required}
DESC=${3:-$NAME}   # description is required: defaults to name

existing=$(dd_find products/ "$NAME")
if [[ -n $existing ]]; then
  id=$(jq -r '.id' <<<"$existing")
  org=$(jq -r '.prod_type' <<<"$existing")
  if [[ $org != "$ORG_ID" ]]; then
    log "ERROR: asset '$NAME' already exists (id=$id) but in organization $org"
    exit 1
  fi
  log "Asset '$NAME' already exists (id=$id)"
else
  body=$(jq -n --arg name "$NAME" --arg desc "$DESC" --argjson org "$ORG_ID" \
    '{name: $name, description: $desc, prod_type: $org}')
  id=$(dd_post products/ "$body" | jq -r '.id')
  log "Asset '$NAME' created (id=$id)"
fi

echo "$id"

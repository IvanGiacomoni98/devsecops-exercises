#!/usr/bin/env bash
# Creates an Organization (API: product_type) if it does not exist.
# Usage:  ./01_organization.sh "<name>" ["<description>"]
# Output: Organization id on stdout (logs on stderr)
set -euo pipefail
source "$(dirname "$0")/common.sh"

NAME=${1:?Organization name is required}
DESC=${2:-}

existing=$(dd_find product_types/ "$NAME")
if [[ -n $existing ]]; then
  id=$(jq -r '.id' <<<"$existing")
  log "Organization '$NAME' already exists (id=$id)"
else
  body=$(jq -n --arg name "$NAME" --arg desc "$DESC" \
    '{name: $name, description: $desc}')
  id=$(dd_post product_types/ "$body" | jq -r '.id')
  log "Organization '$NAME' created (id=$id)"
fi

echo "$id"

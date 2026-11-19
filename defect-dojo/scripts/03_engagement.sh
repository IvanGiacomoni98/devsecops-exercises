#!/usr/bin/env bash
# Creates an Engagement inside an Asset if it does not exist.
# Usage:  ./03_engagement.sh "<name>" <asset_id> [CI/CD|Interactive] [YYYY-MM-DD start] [YYYY-MM-DD end]
# Defaults: CI/CD, start = today, end = today + 1 year (GNU date)
# Output: Engagement id on stdout (logs on stderr)
set -euo pipefail
source "$(dirname "$0")/common.sh"

NAME=${1:?Engagement name is required}
ASSET_ID=${2:?Asset id is required}
TYPE=${3:-CI/CD}
START=${4:-$(date +%F)}
END=${5:-$(date -d '+1 year' +%F)}

case $TYPE in
  CI/CD|Interactive) ;;
  *) log "ERROR: invalid type '$TYPE' (CI/CD|Interactive)"; exit 1 ;;
esac

# Engagement names are not globally unique: search within the asset
existing=$(dd_find engagements/ "$NAME" "product=${ASSET_ID}")
if [[ -n $existing ]]; then
  id=$(jq -r '.id' <<<"$existing")
  log "Engagement '$NAME' already exists in asset $ASSET_ID (id=$id)"
else
  body=$(jq -n \
    --arg name "$NAME" --argjson product "$ASSET_ID" \
    --arg type "$TYPE" --arg start "$START" --arg end "$END" \
    '{name: $name, product: $product, engagement_type: $type,
      target_start: $start, target_end: $end, status: "In Progress"}')
  id=$(dd_post engagements/ "$body" | jq -r '.id')
  log "Engagement '$NAME' created (id=$id)"
fi

echo "$id"

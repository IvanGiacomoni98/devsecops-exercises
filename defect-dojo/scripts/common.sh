#!/usr/bin/env bash
# Common helper functions for the DefectDojo API v2.
# Note: in API v2, Organization = product_type, Asset = product.
# Requires: curl (>= 7.76 for --fail-with-body), jq
set -euo pipefail

: "${DD_URL:?Set DD_URL (e.g. https://defectdojo.example.com)}"
: "${DD_TOKEN:?Set DD_TOKEN (API v2 key, from /api/key-v2)}"

API="${DD_URL%/}/api/v2"

log() { printf '%s\n' "$*" >&2; }

# dd_get <path> [--data-urlencode k=v ...]
dd_get() {
  local path=$1; shift
  curl -sS --fail-with-body -G "${API}/${path}" \
    -H "Authorization: Token ${DD_TOKEN}" \
    -H "Accept: application/json" \
    "$@"
}

# dd_post <path> <json>
dd_post() {
  curl -sS --fail-with-body -X POST "${API}/$1" \
    -H "Authorization: Token ${DD_TOKEN}" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    --data "$2"
}

# dd_find <path> <name> [filter k=v ...]
# Prints the first object (compact JSON) with an EXACT name match, nothing if none exists.
dd_find() {
  local path=$1 name=$2; shift 2
  local args=(--data-urlencode "name=${name}")
  local f
  for f in "$@"; do args+=(--data-urlencode "$f"); done
  dd_get "$path" "${args[@]}" \
    | jq -c --arg n "$name" '[.results[] | select(.name == $n)][0] // empty'
}

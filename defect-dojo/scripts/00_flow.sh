#!/usr/bin/env bash
# Complete flow: Organization -> Asset -> Engagement.
# Scripts are idempotent.
#
#   export DD_URL=https://defectdojo.example.com
#   export DD_TOKEN=xxxxxxxx
#   ./00_flow.sh
set -euo pipefail
cd "$(dirname "$0")"

ORG_ID=$(./01_organization.sh "Vulnerability Management" "Organization for DevSecOps course reources")
ASSET_ID=$(./02_asset.sh "Juice Shop" "$ORG_ID" "Juice Shop project for devsecops course")
ENG_ID=$(./03_engagement.sh "Juice Shop Latest" "$ASSET_ID" "CI/CD")

echo "organization=$ORG_ID asset=$ASSET_ID engagement=$ENG_ID"

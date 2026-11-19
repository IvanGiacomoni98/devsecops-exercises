#!/bin/bash

export DEPENDENCY_TRACK_ENDPOINT=http://localhost:8081/api/v1/bom
export DEPENDENCY_TRACK_API_TOKEN=automation_token
export BOM_PATH=/absolute/BOM_PATH
export PARENT_UUID=collection_project_uuid
export PROJECT_NAME=juice-shop-app
 
curl -H "Content-Type: multipart/form-data" \
    -H "X-API-Key: $DEPENDENCY_TRACK_API_TOKEN" \
    -F "bom=@$BOM_PATH" -F "projectName=$PROJECT_NAME" \
    -F "projectVersion=api-uploaded" -F "autoCreate=true" \
    -F "isLatest=true" -F "projectTags=dso" -F "autoCreate=true" \
    -F "parentUUID=$PARENT_UUID" \
    "$DEPENDENCY_TRACK_ENDPOINT"
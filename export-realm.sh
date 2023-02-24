#!/usr/bin/env bash

export IMAGE_NAME=keycloack-sandbox_keycloak_1
export REALM_NAME=hornbach-service-tool
export EXPORT_FILE_NAME=hornbach-service-tool-realm-export.json

docker exec -it $IMAGE_NAME /opt/jboss/keycloak/bin/standalone.sh \
  -Djboss.socket.binding.port-offset=100 \
  -Dkeycloak.migration.action=export \
  -Dkeycloak.migration.provider=singleFile \
  -Dkeycloak.migration.realmName=$REALM_NAME \
  -Dkeycloak.migration.usersExportStrategy=REALM_FILE \
  -Dkeycloak.migration.file=/tmp/export/$EXPORT_FILE_NAME

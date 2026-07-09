#!/usr/bin/env bash

set -euo pipefail

SSH_TARGET="root@homeassistant.local"
REMOTE_SHCF_PATH="/config/packages/shcf"
LOCAL_SHCF_PATH="packages/shcf"

TIMESTAMP="$(date +"%Y%m%d-%H%M%S")"
REMOTE_BACKUP_PATH="/config/packages/shcf/backups/backup_${TIMESTAMP}"

echo "SHCF deployment started"
echo "Local source: ${LOCAL_SHCF_PATH}"
echo "Remote target: ${SSH_TARGET}:${REMOTE_SHCF_PATH}"
echo

if [ ! -d ".git" ]; then
  echo "Error: This script must be run from the repository root."
  exit 1
fi

if [ ! -d "${LOCAL_SHCF_PATH}" ]; then
  echo "Error: Local SHCF package directory not found: ${LOCAL_SHCF_PATH}"
  exit 1
fi

echo "Creating remote backup..."
ssh "${SSH_TARGET}" "mkdir -p '${REMOTE_BACKUP_PATH}' && find '${REMOTE_SHCF_PATH}' -mindepth 1 -maxdepth 1 ! -name 'backups' -exec cp -a {} '${REMOTE_BACKUP_PATH}/' \;"

echo "Deploying SHCF files to Home Assistant..."

scp -r \
  "${LOCAL_SHCF_PATH}/blueprints" \
  "${LOCAL_SHCF_PATH}/core" \
  "${LOCAL_SHCF_PATH}/dashboards" \
  "${LOCAL_SHCF_PATH}/docs" \
  "${LOCAL_SHCF_PATH}/examples" \
  "${SSH_TARGET}:${REMOTE_SHCF_PATH}/"

echo
echo "Deployment completed successfully."
echo "Backup created at:"
echo "${REMOTE_BACKUP_PATH}"
echo
echo "Next steps:"
echo "1. Check Home Assistant configuration"
echo "2. Restart Home Assistant if required"

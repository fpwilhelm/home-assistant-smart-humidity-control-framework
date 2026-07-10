#!/usr/bin/env bash

###############################################################################
#
# SHCF Device Deployment
#
# Generates and deploys one SHCF Device to Home Assistant.
#
###############################################################################

set -euo pipefail

###############################################################################
# Repository Check
###############################################################################

if [ ! -d ".git" ]; then
    echo "ERROR: Please run this script from the repository root."
    exit 1
fi

###############################################################################
# Parameters
###############################################################################

if [ $# -ne 1 ]; then
    echo
    echo "Usage:"
    echo
    echo "  ./tools/deploy_shcf_device.sh packages/shcf/devices/device_xxxxxxxx.yaml"
    echo
    exit 1
fi

DEVICE_PROFILE="$1"

if [ ! -f "$DEVICE_PROFILE" ]; then
    echo "ERROR: Device Profile not found:"
    echo "  $DEVICE_PROFILE"
    exit 1
fi

###############################################################################
# Read Device Information
###############################################################################

DEVICE_ID=$(
grep "^  id:" "$DEVICE_PROFILE" \
| head -1 \
| sed 's/^  id:[[:space:]]*//'
)

DEVICE_NAME=$(
grep "^  name:" "$DEVICE_PROFILE" \
| head -1 \
| sed 's/^  name:[[:space:]]*//'
)

echo
echo "============================================================"
echo " SHCF Device Deployment"
echo "============================================================"
echo
echo "Device:"
echo "  $DEVICE_NAME"
echo
echo "Device ID:"
echo "  $DEVICE_ID"
echo

###############################################################################
# Generate Package
###############################################################################

echo "Generating Package..."

./tools/generate_device_package.sh "$DEVICE_PROFILE"

echo "OK"
echo

###############################################################################
# Generate Dashboard View
###############################################################################

echo "Generating Dashboard View..."

./tools/generate_device_dashboard.sh "$DEVICE_PROFILE"

echo "OK"
echo

###############################################################################
# Build Shared Dashboard
###############################################################################

echo "Building shared SHCF Dashboard..."

./tools/build_shcf_dashboard.sh

echo "OK"
echo

###############################################################################
# Check generated files
###############################################################################

PACKAGE_FILE="packages/shcf/generated/${DEVICE_ID}.package.yaml"
VIEW_FILE="packages/shcf/generated/${DEVICE_ID}.view.yaml"
DASHBOARD_FILE="packages/shcf/generated/shcf_dashboard.yaml"

if [ ! -f "$PACKAGE_FILE" ]; then
    echo "ERROR:"
    echo "$PACKAGE_FILE"
    echo "not generated."
    exit 1
fi

if [ ! -f "$VIEW_FILE" ]; then
    echo "ERROR:"
    echo "$VIEW_FILE"
    echo "not generated."
    exit 1
fi

if [ ! -f "$DASHBOARD_FILE" ]; then
    echo "ERROR:"
    echo "$DASHBOARD_FILE"
    echo "not generated."
    exit 1
fi

echo "Generated files"

echo "  ✔ $PACKAGE_FILE"
echo "  ✔ $VIEW_FILE"
echo "  ✔ $DASHBOARD_FILE"

echo

###############################################################################
# Home Assistant Deployment
###############################################################################

SSH_TARGET="root@homeassistant.local"
REMOTE_PACKAGE_PATH="/config/packages/shcf_${DEVICE_ID}.package.yaml"
REMOTE_VIEW_DIR="/config/packages/shcf/generated_views"
REMOTE_VIEW_PATH="${REMOTE_VIEW_DIR}/${DEVICE_ID}.view.yaml"
REMOTE_DASHBOARD_DIR="/config/dashboards"
REMOTE_DASHBOARD_PATH="${REMOTE_DASHBOARD_DIR}/shcf_dashboard.yaml"

echo "Deploying to Home Assistant..."
echo
echo "Package target:"
echo "  ${SSH_TARGET}:${REMOTE_PACKAGE_PATH}"
echo
echo "Dashboard view target:"
echo "  ${SSH_TARGET}:${REMOTE_VIEW_PATH}"
echo

echo "Creating remote dashboard view directory..."
ssh "${SSH_TARGET}" "mkdir -p '${REMOTE_VIEW_DIR}' '${REMOTE_DASHBOARD_DIR}'"

echo "Copying generated package..."
scp "${PACKAGE_FILE}" "${SSH_TARGET}:${REMOTE_PACKAGE_PATH}"

echo "Copying generated dashboard view..."
scp "${VIEW_FILE}" "${SSH_TARGET}:${REMOTE_VIEW_PATH}"

echo "Copying shared SHCF dashboard..."
scp "${DASHBOARD_FILE}" "${SSH_TARGET}:${REMOTE_DASHBOARD_PATH}"

echo
echo "Deployment completed successfully."
echo

echo
echo "Files copied successfully."
echo

echo "Shared SHCF dashboard:"
echo "  ${REMOTE_DASHBOARD_PATH}"
echo

###############################################################################
# Home Assistant Configuration Check
###############################################################################

echo "Checking Home Assistant configuration..."

if ssh "${SSH_TARGET}" "ha core check"; then
    echo
    echo "Home Assistant configuration is valid."
else
    echo
    echo "ERROR: Home Assistant configuration check failed."
    echo "Home Assistant was not restarted."
    exit 1
fi

###############################################################################
# Optional Restart
###############################################################################

echo
read -rp "Restart Home Assistant now? [y/N]: " RESTART_ANSWER

case "${RESTART_ANSWER}" in
    y|Y|yes|YES|Yes)
        echo
        echo "Restarting Home Assistant..."
        ssh "${SSH_TARGET}" "ha core restart"
        echo
        echo "Restart command sent successfully."
        ;;
    *)
        echo
        echo "Home Assistant was not restarted."
        ;;
esac

echo
echo "SHCF Device deployment completed successfully."
echo
echo "Generated dashboard view:"
echo "  ${REMOTE_VIEW_PATH}"
echo
echo "Shared SHCF dashboard:"
echo "  ${REMOTE_DASHBOARD_PATH}"
echo
echo "The shared SHCF dashboard must be registered once in configuration.yaml."
echo
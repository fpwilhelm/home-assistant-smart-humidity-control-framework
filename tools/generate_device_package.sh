#!/usr/bin/env bash

set -euo pipefail

if [ ! -d ".git" ]; then
  echo "Error: run this script from the repository root."
  exit 1
fi

if [ $# -ne 1 ]; then
  echo "Usage: $0 packages/shcf/devices/device_<id>.yaml"
  exit 1
fi

DEVICE_PROFILE="$1"
TEMPLATE_FILE="tools/templates/device_package.yaml.tpl"
OUTPUT_DIR="packages/shcf/generated"

if [ ! -f "$DEVICE_PROFILE" ]; then
  echo "Error: device profile not found: $DEVICE_PROFILE"
  exit 1
fi

if [ ! -f "$TEMPLATE_FILE" ]; then
  echo "Error: template file not found: $TEMPLATE_FILE"
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

DEVICE_ID="$(grep -E '^  id:' "$DEVICE_PROFILE" | head -1 | sed 's/^  id:[[:space:]]*//')"
DEVICE_NAME="$(grep -E '^  name:' "$DEVICE_PROFILE" | head -1 | sed 's/^  name:[[:space:]]*//')"
SWITCHING_DEVICE="$(grep -E '^  switching_device:' "$DEVICE_PROFILE" | head -1 | sed 's/^  switching_device:[[:space:]]*//')"
HUMIDITY_SENSOR="$(grep -E '^  humidity_sensor:' "$DEVICE_PROFILE" | head -1 | sed 's/^  humidity_sensor:[[:space:]]*//')"
TEMPERATURE_SENSOR="$(grep -E '^  temperature_sensor:' "$DEVICE_PROFILE" | head -1 | sed 's/^  temperature_sensor:[[:space:]]*//')"

if [ -z "$DEVICE_ID" ] || [ -z "$DEVICE_NAME" ] || [ -z "$SWITCHING_DEVICE" ] || [ -z "$HUMIDITY_SENSOR" ] || [ -z "$TEMPERATURE_SENSOR" ]; then
  echo "Error: required fields are missing in $DEVICE_PROFILE"
  echo "Required:"
  echo "  device.id"
  echo "  device.name"
  echo "  entities.switching_device"
  echo "  entities.humidity_sensor"
  echo "  entities.temperature_sensor"
  exit 1
fi

OUTPUT_FILE="${OUTPUT_DIR}/${DEVICE_ID}.package.yaml"

sed \
  -e "s|__DEVICE_ID__|${DEVICE_ID}|g" \
  -e "s|__DEVICE_NAME__|${DEVICE_NAME}|g" \
  -e "s|__SWITCHING_DEVICE__|${SWITCHING_DEVICE}|g" \
  -e "s|__HUMIDITY_SENSOR__|${HUMIDITY_SENSOR}|g" \
  -e "s|__TEMPERATURE_SENSOR__|${TEMPERATURE_SENSOR}|g" \
  "$TEMPLATE_FILE" > "$OUTPUT_FILE"

echo "Generated package:"
echo "$OUTPUT_FILE"

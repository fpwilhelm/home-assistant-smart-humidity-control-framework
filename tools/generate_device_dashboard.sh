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
TEMPLATE_FILE="tools/templates/device_dashboard.yaml.tpl"
OUTPUT_DIR="packages/shcf/generated"

mkdir -p "$OUTPUT_DIR"

DEVICE_ID="$(grep -E '^  id:' "$DEVICE_PROFILE" | head -1 | sed 's/^  id:[[:space:]]*//')"
DEVICE_NAME="$(grep -E '^  name:' "$DEVICE_PROFILE" | head -1 | sed 's/^  name:[[:space:]]*//')"
SWITCHING_DEVICE="$(grep -E '^  switching_device:' "$DEVICE_PROFILE" | head -1 | sed 's/^  switching_device:[[:space:]]*//')"
HUMIDITY_SENSOR="$(grep -E '^  humidity_sensor:' "$DEVICE_PROFILE" | head -1 | sed 's/^  humidity_sensor:[[:space:]]*//')"
TEMPERATURE_SENSOR="$(grep -E '^  temperature_sensor:' "$DEVICE_PROFILE" | head -1 | sed 's/^  temperature_sensor:[[:space:]]*//')"
POWER_SENSOR="$(grep -E '^  power_sensor:' "$DEVICE_PROFILE" | head -1 | sed 's/^  power_sensor:[[:space:]]*//')"
ENERGY_SENSOR="$(grep -E '^  energy_sensor:' "$DEVICE_PROFILE" | head -1 | sed 's/^  energy_sensor:[[:space:]]*//')"
BATTERY_SENSOR="$(grep -E '^  battery_sensor:' "$DEVICE_PROFILE" | head -1 | sed 's/^  battery_sensor:[[:space:]]*//')"

OUTPUT_FILE="${OUTPUT_DIR}/${DEVICE_ID}.dashboard.yaml"

sed \
  -e "s|__DEVICE_ID__|${DEVICE_ID}|g" \
  -e "s|__DEVICE_NAME__|${DEVICE_NAME}|g" \
  -e "s|__SWITCHING_DEVICE__|${SWITCHING_DEVICE}|g" \
  -e "s|__HUMIDITY_SENSOR__|${HUMIDITY_SENSOR}|g" \
  -e "s|__TEMPERATURE_SENSOR__|${TEMPERATURE_SENSOR}|g" \
  -e "s|__POWER_SENSOR__|${POWER_SENSOR}|g" \
  -e "s|__ENERGY_SENSOR__|${ENERGY_SENSOR}|g" \
  -e "s|__BATTERY_SENSOR__|${BATTERY_SENSOR}|g" \
  "$TEMPLATE_FILE" > "$OUTPUT_FILE"

echo "Generated dashboard:"
echo "$OUTPUT_FILE"

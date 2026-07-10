#!/usr/bin/env bash

set -euo pipefail

if [ ! -d ".git" ]; then
  echo "Error: run this script from the repository root."
  exit 1
fi

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 packages/shcf/devices/device_<id>.yaml"
  exit 1
fi

DEVICE_PROFILE="$1"
TEMPLATE_FILE="tools/templates/device_dashboard_view.yaml.tpl"
OUTPUT_DIR="packages/shcf/generated"

if [ ! -f "$DEVICE_PROFILE" ]; then
  echo "Error: device profile not found: $DEVICE_PROFILE"
  exit 1
fi

if [ ! -f "$TEMPLATE_FILE" ]; then
  echo "Error: dashboard view template not found: $TEMPLATE_FILE"
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

read_profile_value() {
  local key="$1"

  grep -E "^  ${key}:" "$DEVICE_PROFILE" \
    | head -1 \
    | sed "s/^  ${key}:[[:space:]]*//"
}

DEVICE_ID="$(read_profile_value "id")"
DEVICE_NAME="$(read_profile_value "name")"
SWITCHING_DEVICE="$(read_profile_value "switching_device")"
HUMIDITY_SENSOR="$(read_profile_value "humidity_sensor")"
TEMPERATURE_SENSOR="$(read_profile_value "temperature_sensor")"
POWER_SENSOR="$(read_profile_value "power_sensor")"
ENERGY_SENSOR="$(read_profile_value "energy_sensor")"
BATTERY_SENSOR="$(read_profile_value "battery_sensor")"

required_values=(
  "$DEVICE_ID"
  "$DEVICE_NAME"
  "$SWITCHING_DEVICE"
  "$HUMIDITY_SENSOR"
  "$TEMPERATURE_SENSOR"
)

for value in "${required_values[@]}"; do
  if [ -z "$value" ]; then
    echo "Error: required value missing in device profile."
    exit 1
  fi
done

OUTPUT_FILE="${OUTPUT_DIR}/${DEVICE_ID}.view.yaml"

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

echo
echo "Generated SHCF dashboard view:"
echo "$OUTPUT_FILE"
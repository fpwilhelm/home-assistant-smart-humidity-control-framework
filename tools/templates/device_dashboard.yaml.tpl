title: SHCF __DEVICE_NAME__
views:
  - title: Overview
    path: shcf-__DEVICE_ID__
    icon: mdi:air-humidifier
    badges:
      - entity: sensor.shcf___DEVICE_ID___operating_status_display
      - entity: __BATTERY_SENSOR__
    cards:
      - type: entities
        title: SHCF __DEVICE_NAME__ Control
        entities:
          - entity: input_select.shcf___DEVICE_ID___operating_mode
          - entity: input_select.shcf___DEVICE_ID___humidity_profile
          - entity: input_select.shcf___DEVICE_ID___control_characteristic
          - entity: input_select.shcf___DEVICE_ID___target_mode
          - entity: input_select.shcf___DEVICE_ID___timed_operation_behavior_on_target_reached
          - entity: input_number.shcf___DEVICE_ID___custom_target_humidity
          - entity: input_number.shcf___DEVICE_ID___hysteresis
          - entity: input_number.shcf___DEVICE_ID___timed_operation_duration
          - entity: timer.shcf___DEVICE_ID___timed_operation

      - type: entities
        title: SHCF __DEVICE_NAME__ Sensors
        entities:
          - entity: sensor.shcf___DEVICE_ID___current_humidity
          - entity: sensor.shcf___DEVICE_ID___current_temperature
          - entity: sensor.shcf___DEVICE_ID___target_humidity
          - entity: sensor.shcf___DEVICE_ID___switch_on_threshold
          - entity: sensor.shcf___DEVICE_ID___target_humidity_deviation
          - entity: sensor.shcf___DEVICE_ID___indoor_dew_point
          - entity: sensor.shcf___DEVICE_ID___dehumidification_demand
          - entity: sensor.shcf___DEVICE_ID___recommendation

      - type: entities
        title: SHCF __DEVICE_NAME__ Device
        entities:
          - entity: __SWITCHING_DEVICE__
          - entity: __HUMIDITY_SENSOR__
          - entity: __TEMPERATURE_SENSOR__
          - entity: __POWER_SENSOR__
          - entity: __ENERGY_SENSOR__
          - entity: __BATTERY_SENSOR__

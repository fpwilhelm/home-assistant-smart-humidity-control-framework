# ============================================================================
# SHCF Generated Device Dashboard View
# ============================================================================
# Device: __DEVICE_NAME__
# Device ID: __DEVICE_ID__
#
# This file represents one view inside the shared SHCF dashboard.
# Do not edit generated views manually.
# Edit this template or the SHCF Device Profile and regenerate the view.
# ============================================================================

type: sections
max_columns: 4
title: SHCF __DEVICE_NAME__
path: shcf-__DEVICE_ID__

sections:
  - type: grid
    column_span: 4
    cards:
      - type: heading
        heading_style: title
        heading: Control

      - type: tile
        entity: input_select.shcf___DEVICE_ID___operating_mode
        name: Operating Mode
        vertical: false
        features:
          - type: select-options
        features_position: inline

      - type: tile
        entity: input_select.shcf___DEVICE_ID___target_mode
        name: Target Mode
        vertical: false
        features:
          - type: select-options
        features_position: inline

      - type: conditional
        conditions:
          - entity: input_select.shcf___DEVICE_ID___target_mode
            state: "Humidity Profile"
        card:
          type: tile
          entity: input_select.shcf___DEVICE_ID___humidity_profile
          name: Humidity Profile
          vertical: false
          features:
            - type: select-options
          features_position: inline

      - type: conditional
        conditions:
          - entity: input_select.shcf___DEVICE_ID___target_mode
            state: "Humidity Profile"
        card:
          type: tile
          entity: input_select.shcf___DEVICE_ID___control_characteristic
          name: Control Characteristic
          vertical: false
          features:
            - type: select-options
          features_position: inline

      - type: conditional
        conditions:
          - entity: input_select.shcf___DEVICE_ID___target_mode
            state: "Custom Target"
        card:
          type: entities
          title: Custom Target
          entities:
            - entity: input_number.shcf___DEVICE_ID___custom_target_humidity
              name: Target Humidity

      - type: conditional
        conditions:
          - entity: input_select.shcf___DEVICE_ID___operating_mode
            state: "Timed Operation"
        card:
          type: entities
          title: Timed Operation
          entities:
            - entity: input_number.shcf___DEVICE_ID___timed_operation_duration
              name: Duration

            - entity: input_select.shcf___DEVICE_ID___timed_operation_behavior_on_target_reached
              name: On Target Reached

            - entity: input_select.shcf___DEVICE_ID___timed_operation_behavior_on_timer_finished
              name: On Timer Finished

            - entity: timer.shcf___DEVICE_ID___timed_operation
              name: Timer

  - type: grid
    column_span: 3
    cards:
      - type: heading
        heading_style: title
        heading: Local Climate Conditions

      - type: custom:gauge-card-pro
        entity: __HUMIDITY_SENSOR__
        min: 0
        max: 100
        needle: true
        gradient: true
        segments:
          - pos: 0
            color: "#9E9E9E"
          - pos: 40
            color: "#9E9E9E"
          - pos: 55
            color: "#81C784"
          - pos: 65
            color: "#2E7D32"
          - pos: 70
            color: "#FFD54F"
          - pos: 75
            color: "#FB8C00"
          - pos: 80
            color: "#D32F2F"
          - pos: 100
            color: "#D32F2F"
        titles:
          primary:
            value: |
              {% if is_state(
                'input_select.shcf___DEVICE_ID___target_mode',
                'Humidity Profile'
              ) %}
                {{ states('input_select.shcf___DEVICE_ID___humidity_profile') }}
              {% else %}
                Custom Target
              {% endif %}
          secondary:
            value: >-
              Target range:
              {{ states('sensor.shcf___DEVICE_ID___target_humidity_lower_limit') | int }}
              –
              {{ states('sensor.shcf___DEVICE_ID___target_humidity_upper_limit') | int }}
              %
        animation_speed: "off"
        setpoint:
          type: entity
          value: sensor.shcf___DEVICE_ID___target_humidity
        min_indicator:
          type: entity
          value: sensor.shcf___DEVICE_ID___target_humidity_lower_limit
          label: true
          opacity: 0.1
          precision: 0
        max_indicator:
          type: entity
          value: sensor.shcf___DEVICE_ID___target_humidity_upper_limit
          label: true
          opacity: 0.1
          precision: 0
        value_texts:
          primary:
            unit_before_value: false

      - type: history-graph
        entities:
          - __HUMIDITY_SENSOR__
        hours_to_show: 24
        show_names: false
        logarithmic_scale: false
        expand_legend: true

      - type: statistics-graph
        entities:
          - __TEMPERATURE_SENSOR__
        days_to_show: 3
        period: 5minute
        chart_type: line
        stat_types:
          - mean
        hide_legend: true

  - type: grid
    column_span: 3
    cards:
      - type: heading
        heading_style: title
        heading: Power and Energy

      - type: custom:gauge-card-pro
        entity: __POWER_SENSOR__
        min: 0
        max: 800
        needle: true
        gradient: true
        segments:
          - pos: 0
            color: "#9E9E9E"
          - pos: 100
            color: "#9E9E9E"
          - pos: 450
            color: "#81C784"
          - pos: 550
            color: "#2E7D32"
          - pos: 620
            color: "#FFD54F"
          - pos: 700
            color: "#E53935"
          - pos: 800
            color: "#E53935"
        titles:
          primary:
            value: Power Consumption
          secondary:
            value: __DEVICE_NAME__
        animation_speed: "off"
        value_texts:
          primary:
            unit_before_value: false
        gradient_resolution: auto

      - type: statistics-graph
        entities:
          - __POWER_SENSOR__
        days_to_show: 1
        period: 5minute
        chart_type: line
        stat_types:
          - mean

      - type: statistics-graph
        entities:
          - __ENERGY_SENSOR__
        days_to_show: 7
        period: hour
        chart_type: line
        stat_types:
          - change

cards: []

badges:
  - type: entity
    show_name: false
    show_state: true
    show_icon: false
    entity: sensor.shcf___DEVICE_ID___operating_status_display

  - type: entity
    show_name: true
    show_state: true
    show_icon: true
    entity: __HUMIDITY_SENSOR__
    name: Current

  - type: entity
    show_name: true
    show_state: true
    show_icon: true
    entity: sensor.shcf___DEVICE_ID___target_humidity
    name: Target

  - type: entity
    show_name: true
    show_state: true
    show_icon: true
    entity: sensor.shcf___DEVICE_ID___target_humidity_deviation
    name: Deviation

  - type: entity
    show_name: true
    show_state: true
    show_icon: true
    entity: sensor.shcf___DEVICE_ID___switch_on_threshold
    name: Switch-on Threshold

  - type: entity
    show_name: true
    show_state: true
    show_icon: true
    entity: sensor.shcf___DEVICE_ID___hysteresis
    name: Hysteresis

  - type: entity
    show_name: true
    show_state: true
    show_icon: true
    entity: __TEMPERATURE_SENSOR__
    name: Temperature

  - type: entity
    show_name: true
    show_state: true
    show_icon: true
    entity: sensor.shcf___DEVICE_ID___dehumidification_demand
    name: Demand

  - type: entity
    show_name: true
    show_state: true
    show_icon: true
    entity: sensor.shcf___DEVICE_ID___recommendation
    name: Recommendation

  - type: entity
    show_name: true
    show_state: true
    show_icon: true
    entity: __POWER_SENSOR__
    name: Power

  - type: entity
    show_name: true
    show_state: true
    show_icon: true
    entity: __ENERGY_SENSOR__
    name: Energy

  - type: entity
    show_name: false
    show_state: true
    show_icon: true
    entity: __BATTERY_SENSOR__

header:
  card:
    type: markdown
    text_only: true
    content: "# SHCF : __DEVICE_NAME__"
  layout: start
  badges_position: bottom
  badges_wrap: wrap
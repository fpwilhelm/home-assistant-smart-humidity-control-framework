# Controller Reference

## Purpose

The controller is the central control component of the Smart Humidity Control Framework.

It continuously monitors all available sensor data, evaluates the current environmental conditions, and determines whether the dehumidifier should be turned on or off.

The controller contains control logic only.

Communication with Home Assistant is handled by the integration or blueprint layer.

---

# Responsibilities

The controller is responsible for

- evaluating sensor data
- evaluating the target humidity
- applying hysteresis
- controlling the dehumidifier
- managing operating modes
- managing operating states
- enforcing minimum runtime
- enforcing minimum idle time
- executing safety functions
- providing diagnostic information

The controller is **not** responsible for

- dashboard visualization
- user interface
- device discovery
- Home Assistant configuration

---

# Operating Modes

The operating mode defines the controller's overall behavior.

## Automatic

Default operating mode.

The controller automatically regulates the dehumidifier based on the current humidity and the active configuration.

---

## Timed Operation

The dehumidifier runs continuously for a predefined period regardless of the measured humidity.

When the timer expires, the controller automatically returns to **Automatic** mode.

---

## Off *(planned)*

The controller remains active but never starts the dehumidifier automatically.

Sensor values and diagnostics continue to be updated.

---

## Manual *(future)*

The user controls the dehumidifier manually.

The controller continues to monitor all values but does not perform automatic switching.

---

## Maintenance *(future)*

Used for service and testing purposes.

Automatic control decisions are suspended.

---

# Operating States

At any given time, the controller is in exactly one operating state.

The operating state describes the controller's current behavior.

## Initializing

The controller is starting up or restoring its runtime data.

---

## Dehumidifying

The dehumidifier is currently running.

---

## Target Range Reached

The measured humidity is within the desired range.

No switching action is required.

---

## Waiting for Hysteresis

The humidity has changed but has not yet crossed the switching threshold defined by the hysteresis.

---

## Minimum Runtime Active

The dehumidifier continues running although the target humidity has already been reached.

---

## Minimum Idle Time Active

The controller keeps the dehumidifier switched off although the switch-on conditions are already fulfilled.

---

## Timed Operation Active

The dehumidifier is running because timed operation is active.

---

## Controller Disabled

Automatic control has been disabled.

---

## Sensor Error

At least one required sensor does not provide valid data.

For safety reasons, no automatic switching is performed.

---

## Error

Internal controller error.

---

# Priorities

If multiple conditions could apply simultaneously, the following priority order is used.

| Priority | State |
|----------:|-------|
| 1 | Error |
| 2 | Sensor Error |
| 3 | Maintenance |
| 4 | Controller Disabled |
| 5 | Timed Operation |
| 6 | Minimum Runtime Active |
| 7 | Minimum Idle Time Active |
| 8 | Automatic Control |

This guarantees deterministic controller behavior.

---

# State Transitions

The controller reacts to events.

Typical transitions include

```text
Initializing
      │
      ▼
Automatic
      │
      ▼
Humidity exceeds switch-on threshold
      │
      ▼
Dehumidifying
      │
      ▼
Target Range Reached
      │
      ▼
Minimum Runtime Active
      │
      ▼
Waiting for Hysteresis
      │
      ▼
Automatic
```

Timed operation overrides automatic control.

```text
Automatic
      │
      ▼
Timed Operation Started
      │
      ▼
Timed Operation Active
      │
      ▼
Timer Expired
      │
      ▼
Automatic
```

---

# Events

The following events trigger a controller evaluation.

- humidity changed
- temperature changed
- humidity profile changed
- control characteristic changed
- target humidity changed
- hysteresis changed
- timed operation started
- timed operation ended
- controller enabled
- controller disabled
- Home Assistant restarted
- sensor failure detected
- sensor recovered

---

# Control Cycle

Each controller evaluation follows the same sequence.

1. Read sensor data
2. Validate sensor values
3. Determine target humidity
4. Evaluate operating mode
5. Check safety conditions
6. Apply hysteresis
7. Make switching decision
8. Update operating state
9. Update diagnostics

---

# Safety Functions

The controller protects both the dehumidifier and the controlled environment from unnecessary switching.

Implemented safety mechanisms include

- minimum runtime
- minimum idle time
- hysteresis
- sensor validation
- fault detection

---

# Diagnostics

The controller provides comprehensive diagnostic information.

Examples include

- current operating mode
- current operating state
- last switching reason
- last switching event
- active hysteresis
- current target humidity
- current control decision

These diagnostics improve transparency, troubleshooting, and support.

---

# Extensibility

The controller has been designed with a modular architecture.

Future functionality can be added without changing existing controller behavior.

Planned extensions include

- dew point control
- outdoor temperature support
- weather forecast integration
- window contact integration
- ventilation control
- energy optimization
- AI-assisted target humidity optimization

---

# Summary

The controller is the functional core of the Smart Humidity Control Framework.

It defines the complete control behavior independently of its implementation as either a Home Assistant blueprint or a custom integration.

This separation ensures a clear, maintainable, and extensible control architecture.
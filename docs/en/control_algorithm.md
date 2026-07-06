# Control Algorithm

This document describes the control algorithm of the Smart Humidity Control Framework.

It defines the functional behavior of the controller independently of Home Assistant, YAML, blueprints, or a native integration.

The algorithm forms the core of the framework.

---

# Objective

The controller regulates the relative humidity of a room as efficiently as possible towards the desired target humidity.

The algorithm is designed to

- avoid unnecessary switching,
- minimize energy consumption,
- support different types of dehumidifiers,
- cover various application scenarios,
- and ensure that every control decision remains transparent and understandable.

---

# Architecture

The controller processes only pre-calculated information.

It does not calculate target humidity, hysteresis, or switching thresholds itself.

```text
User
   │
   ▼
Configuration
   │
   ▼
Computed Values
   │
   ▼
Controller
   │
   ▼
Devices
```

This separation keeps the control algorithm simple, transparent, and independent of the underlying implementation.

---

# Inputs

The controller uses only the following information.

## Operating Mode

- Off
- Automatic
- Continuous Operation
- Timed Operation

## Measurements

- Current relative humidity
- Current temperature

## Computed Values

- Target humidity
- Switch-on threshold
- Hysteresis
- Target deviation
- Dehumidification demand

## Time Control

- Timer active
- Remaining runtime

## Optional Protection Functions

- Minimum runtime
- Minimum idle time

---

# Outputs

The controller may only influence the following components.

- Dehumidifier
- Timed operation
- Operating mode, for example returning to Automatic mode

All calculations are performed outside the controller.

---

# Priorities

Operating modes and protection functions follow a fixed priority order.

```text
Error

↓

Sensor Error

↓

Off

↓

Continuous Operation

↓

Timed Operation

↓

Optional Protection Functions

↓

Automatic
```

Higher-priority rules always override lower-priority rules.

---

# Operating Modes

## Off

The dehumidifier remains switched off.

Changes to

- humidity profile
- target humidity
- control characteristic

do not automatically restart the controller.

Automatic regulation resumes only after switching to an active operating mode.

---

## Continuous Operation

The dehumidifier remains permanently switched on.

Sensor values continue to be calculated and displayed.

They do not influence the controller.

---

## Timed Operation

During timed operation, the dehumidifier remains switched on.

Optionally, timed operation may

- end when the target humidity is reached, or
- automatically return to Automatic mode.

When the timer expires, the configured operating mode is restored.

---

## Automatic

Automatic mode represents the actual control algorithm.

The controller uses hysteresis.

### Switch On

```text
Current Humidity > Switch-on Threshold
```

↓

Turn on the dehumidifier

### Switch Off

```text
Current Humidity ≤ Target Humidity
```

↓

Turn off the dehumidifier

This creates stable regulation without unnecessary switching.

---

# Immediate Activation

If the user lowers the target humidity and the current humidity already exceeds the new target, automatic regulation starts immediately.

In this situation, hysteresis is intentionally ignored.

Once the target humidity has been reached for the first time, normal hysteresis control resumes.

This ensures immediate response to user changes while maintaining long-term control stability.

---

# Optional Protection Functions

The controller may support additional protection mechanisms.

These functions are optional and are primarily intended for dehumidifiers that require compressor protection.

Devices designed for continuous operation may not require these functions.

## Minimum Runtime

After being switched on, the dehumidifier may remain active for a configurable minimum runtime.

This reduces unnecessary switching.

## Minimum Idle Time

After being switched off, the dehumidifier may remain off for a configurable minimum idle time.

This prevents frequent restarts.

---

# Sensor Validation

Before each control decision, all required measurements are validated.

Invalid values include, for example,

- `unknown`
- `unavailable`
- empty values
- non-numeric values
- obviously implausible measurements

If invalid measurements are detected, no automatic switching is performed.

The controller enters the **Sensor Error** state.

---

# State Model

The controller supports the following logical states.

```text
Off

Automatic – Waiting

Automatic – Dehumidifying

Automatic – Minimum Runtime

Automatic – Target Reached

Continuous Operation

Timed Operation Active

Timed Operation Finished

Sensor Error

Error
```

These states are provided through the operating status.

---

# Design Principles

The control algorithm follows these principles.

## Device Independent

The algorithm must not depend on characteristics of a specific dehumidifier.

## Modular

All calculations are performed outside the controller.

The controller makes decisions only.

## Transparent

Every control decision should always be understandable based on the available sensor values.

## Extensible

New sensors and control strategies should be integrated without fundamentally changing the algorithm.

---

# Future Enhancements

The control algorithm provides the foundation for future extensions.

Planned enhancements include

- adaptive hysteresis
- learning humidity profiles
- dew point control
- mold risk assessment
- ventilation recommendations
- multiple dehumidifiers
- ventilation system integration
- fan integration
- energy-optimized control strategies

All future functionality should build upon the control algorithm described in this document.
# Architecture

## Purpose

The Home Assistant Smart Humidity Control Framework provides a modular architecture for intelligent humidity control.

Its purpose is to separate hardware, configuration, control logic and visualization into independent layers.

This separation allows the same control algorithm to be reused across different Home Assistant implementations while remaining independent of manufacturers and specific devices.

The architecture is designed to support both today's reference implementation and future automation blueprints and native Home Assistant integrations.

---

# Design Principles

The framework follows five fundamental principles.

## Device Independent

The framework is not tied to any specific manufacturer or dehumidifier.

Only the actuator capabilities are relevant.

For dehumidifiers this typically means:

- continuous operation
- automatic restart after power loss
- preservation of operating mode after power restoration

All control decisions are performed by Home Assistant.

---

## Modular

Every architectural layer has a clearly defined responsibility.

Each layer can evolve independently without affecting the remaining layers.

---

## Transparent

Every controller decision should be explainable using available sensor values and calculated parameters.

Hidden logic should be avoided.

---

## Extensible

New sensors, actuators and control strategies should be integrated without redesigning the overall architecture.

---

## Easy to Understand

The framework should remain understandable for beginners while providing enough flexibility for advanced users.

A basic installation requires only a few entities.

Additional hardware simply extends the available functionality.

---

# Architecture Overview

The framework consists of four independent architectural layers.

```text
┌────────────────────────────────────────────────────────────┐
│ Layer 1                                                    │
│ Hardware                                                   │
│                                                            │
│ • Actuators                                                │
│ • Sensors                                                  │
│ • Optional Components                                      │
└────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────────┐
│ Layer 2                                                    │
│ Configuration                                              │
│                                                            │
│ • Device Configuration                                     │
│ • Installation Configuration                               │
│ • User Configuration                                       │
└────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────────┐
│ Layer 3                                                    │
│ Controller                                                 │
│                                                            │
│ • Operating Modes                                          │
│ • Humidity Profiles                                        │
│ • Protection Levels                                        │
│ • Target Modes                                             │
│ • Target Humidity                                          │
│ • Hysteresis                                               │
│ • Control Algorithm                                        │
└────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────────┐
│ Layer 4                                                    │
│ Visualization                                              │
│                                                            │
│ • Dashboard                                                │
│ • Status                                                   │
│ • Gauges                                                   │
│ • Charts                                                   │
│ • Statistics                                               │
└────────────────────────────────────────────────────────────┘
```

---

# Layer 1 – Hardware

The hardware layer contains every physical component.

Examples include:

- dehumidifiers
- smart plugs
- temperature sensors
- humidity sensors
- outdoor sensors
- ventilation systems
- fans

The framework remains independent of the hardware manufacturer.

---

# Layer 2 – Configuration

This layer contains all configuration data.

Examples include:

## Device Configuration

- rated power
- maximum power
- tank size
- continuous drain

## Installation Configuration

- sensor assignment
- actuator assignment
- dashboard settings

## User Configuration

- humidity profiles
- protection levels
- operating mode
- target mode

No control logic exists within this layer.

---

# Layer 3 – Controller

The controller represents the core of the Smart Humidity Control Framework.

It evaluates measurements and calculated values provided by the Template Sensors.

The controller itself performs no calculations.

Instead it decides only:

- switch actuator on
- switch actuator off
- start timed mode
- stop timed mode
- change operating mode

The detailed controller behaviour is documented in:

`control_algorithm.md`

---

# Layer 4 – Visualization

The visualization layer provides all user-facing information.

Examples include:

- dashboards
- gauges
- charts
- statistics
- operating status
- energy information

The visualization layer never influences controller decisions.

---

# Minimum Requirements

The framework requires only a few mandatory components.

## Required

- actuator
- temperature sensor
- humidity sensor

For dehumidifiers:

- continuous operation
- automatic restart after power restoration

## Recommended

- power measurement
- energy measurement

## Optional

- outdoor temperature
- outdoor humidity
- outdoor dew point
- wall temperature
- window sensors
- weather forecast
- additional sensors

---

# Future Architecture

The same architecture will be used for all implementation levels.

```text
Control Algorithm
        │
        ▼
Controller Reference
        │
        ▼
Automation Blueprint
        │
        ▼
Native Home Assistant Integration
```

The implementation changes.

The architecture does not.
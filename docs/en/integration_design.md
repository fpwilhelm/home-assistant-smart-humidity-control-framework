# Integration Design

This document describes the long-term architecture of the native **Smart Humidity Control Framework** integration for Home Assistant.

It defines how the framework will evolve from the current reference implementation into a fully integrated Home Assistant component.

The document describes the conceptual architecture only and is intentionally independent of implementation details.

---

# Objective

The native integration shall provide the complete functionality of the Smart Humidity Control Framework without requiring users to manually create helpers, template sensors, automations, or dashboards.

The integration shall automatically create and manage all framework components.

---

# Design Principles

The integration follows the core principles of the Smart Humidity Control Framework.

- Manufacturer independent
- Modular
- Transparent
- Extensible
- Reusable
- Easy to configure

The underlying control algorithm remains identical to the reference implementation.

Only the implementation changes.

---

# Architecture

The native integration represents one possible implementation of the framework architecture.

```text
Smart Humidity Control Framework
                │
                ▼
Native Home Assistant Integration
                │
                ▼
Configuration
                │
                ▼
Framework Components
                │
                ▼
Controller
                │
                ▼
Switching Device
                │
                ▼
Reference Device
```

The framework architecture remains independent of Home Assistant.

---

# Configuration

The integration shall provide a graphical configuration interface.

Users should not need to edit YAML files.

The integration will use

- Config Flow
- Options Flow

for all configuration tasks.

---

# Framework Components

The integration automatically manages all required framework components.

Examples include

- Humidity Profiles
- Control Characteristics
- Target Modes
- Operating Modes
- Device Configuration
- Template Sensors
- Controller
- Diagnostics

Users should configure the framework rather than individual Home Assistant entities.

---

# Device Configuration

Each managed device is described by its technical characteristics.

Examples include

- rated power
- dehumidification capacity
- tank capacity
- condensate drain mode
- supported operating modes
- automatic restart capability

The integration uses this information to optimize control behavior and future diagnostic functions.

---

# Controller

The native controller implements the same logical behavior as the reference implementation.

Its responsibilities include

- operating mode handling
- hysteresis control
- timer management
- immediate activation after target changes
- controller state calculation
- switching device control

The control algorithm itself remains identical across all framework implementations.

---

# Diagnostics

The integration shall provide built-in diagnostic functions.

Examples include

- sensor validation
- configuration validation
- device availability
- controller status
- operating statistics
- warning messages

Future versions may include

- estimated tank filling level
- maintenance reminders
- efficiency analysis

---

# Dashboard Generation

The integration should optionally generate a complete dashboard.

The generated dashboard should include

- operating controls
- humidity gauge
- target range visualization
- operating status
- power monitoring
- energy monitoring
- warning indicators
- diagnostic information

Users should be able to customize the generated dashboard afterwards.

---

# Device Support

The framework is designed to support different switching devices.

Examples include

- smart plugs
- relays
- Shelly devices
- contactors

The reference device remains a dehumidifier.

Future versions may additionally support other humidity reduction strategies.

---

# Future Extensions

The architecture has been designed to support future framework capabilities without requiring fundamental architectural changes.

Examples include

- multiple dehumidifiers
- ventilation systems
- fans
- automatic window control
- adaptive control algorithms
- learning humidity profiles
- dew point control
- mold risk assessment
- building drying mode
- multiple humidity reduction strategies

---

# Migration

The reference implementation serves as the migration path towards the native integration.

```text
Reference Implementation
            │
            ▼
Automation Blueprint
            │
            ▼
Native Home Assistant Integration
```

Users should be able to migrate without changing the conceptual framework.

---

# Summary

The native Home Assistant integration is the long-term implementation target of the Smart Humidity Control Framework.

It preserves the conceptual architecture of the framework while replacing manual Home Assistant configuration with an integrated, user-friendly solution.

The framework remains independent of manufacturers, devices, and future implementation technologies.
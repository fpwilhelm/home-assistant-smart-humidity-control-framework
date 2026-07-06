# Integration Design

## Purpose

This document describes the planned architecture of the future **Smart Humidity Control** integration for Home Assistant.

It defines the overall architecture, major components, data flow, and responsibilities of each module.

This document describes the target architecture and is independent of the current blueprint implementation.

---

# Goals

The integration is designed to

- support multiple dehumidifiers
- manage an unlimited number of rooms
- be fully configurable through the Home Assistant user interface
- require no YAML configuration
- automatically create all required entities
- be easy to extend
- provide comprehensive documentation

---

# Integration Overview

The integration consists of several logically separated components.

```text
Smart Humidity Control

├── Configuration
├── Device Management
├── Controller
├── Profile Management
├── Runtime Data
├── Entities
├── Dashboard
└── Diagnostics
```

Each component has clearly defined responsibilities and interfaces.

---

# Configuration

Configuration is performed entirely through Home Assistant Config Entries.

Among other things, the user selects

- Dehumidifier
- Smart switch
- Humidity sensor
- Temperature sensor
- Energy meter
- Power sensor
- Default room profile
- Default protection level

The integration automatically creates all required entities.

---

# Device Management

The device management component is responsible for all physical devices.

This includes, for example,

- dehumidifiers
- smart switches
- sensors
- power monitoring
- energy monitoring

It provides all required hardware information to the controller.

---

# Controller

The controller is the core of the integration.

It is responsible for all control decisions.

These include

- target humidity calculation
- hysteresis control
- switching logic
- operating mode handling
- timed operation
- minimum runtime
- minimum idle time
- safety functions

The controller performs logical decisions only.

Communication with Home Assistant is handled through the entity layer.

---

# Profile Management

The profile management component maintains all room profiles.

Each profile defines, among other things,

- base humidity
- recommended humidity range
- recommended hysteresis
- description

The integration provides a set of predefined standard profiles.

Users will also be able to create custom profiles in the future.

---

# Runtime Data

During operation, the integration stores various runtime values.

Examples include

- current target humidity
- operating mode
- operating status
- active hysteresis
- remaining timer
- last switching event
- runtime statistics

These values are used both for control decisions and visualization.

---

# Entities

The integration automatically creates all required Home Assistant entities.

Examples include

## Sensors

- current humidity
- temperature
- target humidity
- target range
- operating status
- power consumption
- energy consumption

## Select Entities

- room profile
- protection level
- operating mode

## Number Entities

- target humidity
- hysteresis
- timed operation duration

## Switch Entities

- automatic control enabled
- controller enabled

## Button Entities

- start timed operation
- stop timed operation
- reset statistics

## Binary Sensor Entities

- dehumidifier running
- target range reached
- timed operation active
- fault condition

---

# Dashboard

The integration provides all information required for dashboards.

The dashboard itself is not part of the integration.

It only uses the entities exposed by the integration.

This allows users to build completely custom dashboards.

---

# Diagnostics

The integration provides extensive diagnostic information.

Examples include

- current control decision
- last switching event
- blocking reason
- active operating mode
- controller status
- sensor status

These diagnostics simplify troubleshooting and support.

---

# Extensibility

The architecture is designed to be modular.

Future functionality can therefore be added without affecting existing installations.

Planned extensions include

- multiple dehumidifiers per room
- dew point control
- outdoor temperature support
- window contact integration
- ventilation control
- weather forecast integration
- energy optimization
- scheduling
- automatic profile recommendations

---

# Relationship to the Blueprint

The current blueprint represents the first implementation stage of the project.

The future integration will adopt the proven control logic from the blueprint while extending it with

- graphical configuration
- automatic entity creation
- improved diagnostics
- greater extensibility
- easier operation

This approach allows existing users to migrate with minimal effort.

---

# Design Principles

The integration follows these core principles.

- Home Assistant compliant
- clear separation of responsibilities
- minimal user configuration
- automatic setup
- transparent control decisions
- comprehensive diagnostics
- high reusability
- easy extensibility
- long-term maintainability

---

# Summary

The Smart Humidity Control integration provides a fully integrated solution for intelligent dehumidifier control within Home Assistant.

It builds upon the control logic developed in the blueprint and extends it with a modern, modular, and fully configurable architecture.
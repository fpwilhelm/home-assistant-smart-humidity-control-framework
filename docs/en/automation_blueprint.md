# Automation Blueprint

## Purpose

This document describes the Home Assistant blueprint of the Smart Humidity Control Framework.

The blueprint provides the complete reference implementation of the framework within Home Assistant.

It enables users to deploy an intelligent dehumidifier control system without manually creating the complete automation logic.

The blueprint serves as the bridge between the reference implementation and a future native Home Assistant integration.

---

# Objectives

The blueprint pursues the following goals.

- Easy installation
- Manufacturer independence
- Reusability
- Consistent user experience
- Minimal manual configuration

After setup, users should have a fully functional framework ready for operation.

---

# Architecture

The blueprint represents all framework components within Home Assistant.

```text
Blueprint

        │

        ▼

Configuration

        │

        ▼

Framework

        │

        ▼

Controller

        │

        ▼

Dehumidifier
```

The blueprint implements the same architecture as the reference implementation.

---

# User Input

During setup, the blueprint requests all required information.

## Devices

- Dehumidifier
- Switchable smart plug or relay
- Temperature and humidity sensor

---

## Device Properties

- Supports continuous operation
- Automatic restart after power loss
- Condensate drain configuration

Recommended properties

- Rated power
- Maximum dehumidification capacity
- Water tank capacity

---

## Basic Settings

- Humidity profile
- Control characteristic
- Target mode

Optional

- Custom target humidity

---

# Components Provided by the Blueprint

The blueprint provides all components of the reference implementation.

## Helpers

All required Home Assistant helper entities.

---

## Template Sensors

All calculated sensors of the framework.

---

## Controller

The complete control logic.

---

## Automations

All automations required to operate the framework.

---

## Dashboard

Optionally, a dashboard template may be provided based on the reference dashboard.

---

# Supported Devices

The blueprint is completely manufacturer independent.

It supports any dehumidifier that

- supports continuous operation,
- automatically resumes operation after power is restored,
- and can be controlled through a smart plug or relay.

---

# User Experience

Users should not need to edit YAML files manually.

All required configuration should be performed through the blueprint interface.

After setup, the framework should be immediately ready for use.

---

# Reference Implementation

The blueprint follows the reference implementation of the Smart Humidity Control Framework.

Dashboard, controller, template sensors, and helper entities should behave identically.

This allows the blueprint and the reference implementation to be compared at any time.

---

# Extensibility

The blueprint is designed to support future extensions.

Examples include

- multiple dehumidifiers
- multiple sensors
- additional warning functions
- water tank level sensor
- ventilation systems
- fans
- special programs
- additional humidity profiles

Existing installations should continue to work whenever possible.

---

# Transition to the Native Integration

The blueprint represents the first complete implementation of the framework.

A future native Home Assistant integration should provide the same functionality.

Migration from the blueprint to the native integration should be as simple as possible for existing users.

---

# Design Principles

## Manufacturer Independent

The blueprint must not depend on features of any specific manufacturer.

---

## Modular

New components should be added without affecting existing installations.

---

## Reusable

A single blueprint should support any number of dehumidifier installations.

---

## Consistent

The blueprint and the reference implementation should always behave identically.

---

## Future-Proof

The blueprint serves as the foundation for the future native Home Assistant integration.

---

# Future

Planned future extensions include

- automatic dashboard creation
- automatic device recommendations
- predefined device profiles for known dehumidifier models
- automatic import of device properties
- water tank level estimation
- water tank level sensors
- multiple dehumidifiers
- multi-zone operation
- centralized framework management

---

# Summary

The blueprint provides the complete reference implementation of the Smart Humidity Control Framework within Home Assistant.

It enables users to deploy an intelligent dehumidifier control system while also serving as the foundation for the future native Home Assistant integration.

The blueprint is therefore much more than a simple automation—it is the first installable implementation of the complete framework.
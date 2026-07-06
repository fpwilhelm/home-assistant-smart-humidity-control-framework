# Installation Guide

## Purpose

This document describes the installation process of the Smart Humidity Control Framework.

It explains the required prerequisites and the different installation methods.

The exact installation procedure depends on the implementation being used.

---

# Installation Methods

The framework will eventually support three different installation methods.

```text
Reference Implementation

↓

Automation Blueprint

↓

Native Home Assistant Integration
```

All three approaches are based on the same architecture and provide the same functionality.

---

# Prerequisites

Before installing the framework, the following requirements should be met.

## Home Assistant

- Current Home Assistant version
- Access to the Home Assistant configuration
- Basic knowledge of Home Assistant

---

## Hardware

The following hardware is required.

- Reference Device (currently: Dehumidifier)
- Temperature and humidity sensor
- Switchable smart plug or relay

The following hardware is recommended.

- Power measurement
- Energy consumption measurement
- Continuous condensate drain

---

# Reference Implementation

The reference implementation serves as the foundation for development, testing, and documentation.

Installation is currently performed manually.

This includes, among other components,

- Helpers
- Template Sensors
- Controller
- Automations
- Reference Dashboard

This installation method is primarily intended for understanding the framework and developing new features.

---

# Installation via Automation Blueprint

The Automation Blueprint is the recommended installation method for most users.

The Automation Blueprint creates and configures all required framework components.

The user only needs to configure

- the reference device
- the temperature and humidity sensor
- the switching device
- the desired basic settings

After setup, the framework is immediately ready for operation.

---

# Native Home Assistant Integration

In the long term, the framework will be available as a native Home Assistant integration.

The integration will perform the complete setup automatically.

The user will simply select the devices to be used.

All remaining framework components will be created and managed automatically.

---

# Dashboard

A reference dashboard template may be provided for both the Reference Implementation and the Automation Blueprint.

It is based on the reference dashboard of the reference implementation and can be customized if desired.

A future native Home Assistant integration may provide additional dashboard support.

---

# Updates

New framework versions should preserve existing installations whenever possible.

Updates should maintain existing configurations, humidity profiles, and user settings.

---

# Migration

Migration between different installation methods should be as simple as possible.

Planned migration paths include

- Reference Implementation → Automation Blueprint
- Automation Blueprint → Native Home Assistant Integration

The logical framework configuration should remain unchanged whenever possible.

---

# Troubleshooting

If problems occur, the following should be checked first.

- The sensor provides valid measurements.
- The reference device automatically restarts after power restoration.
- The smart plug or relay switches correctly.
- The controller is not in **Off** operating mode.
- All devices are available.

Additional diagnostic information is provided by the reference dashboard.

---

# Future

Planned future enhancements include

- Automatic dashboard creation
- Automatic device detection
- Automatic import of known device properties
- Installation wizard
- Automatic migration between the Automation Blueprint and the native Home Assistant integration

---

# Summary

The Smart Humidity Control Framework supports multiple installation methods.

The reference implementation serves as the basis for development and documentation.

The Automation Blueprint is the recommended installation method for most users of the current framework version.

In the long term, a native Home Assistant integration will provide fully automated framework deployment.
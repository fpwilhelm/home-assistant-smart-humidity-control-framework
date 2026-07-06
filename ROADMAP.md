# Roadmap

This roadmap describes the planned evolution of the Smart Humidity Control Framework.

It outlines the long-term vision of the project and serves as a guide for future development.

---

# Project Status

| Version | Status |
|----------|:------:|
| Architecture | ✅ |
| Reference Implementation | ✅ |
| Automation Blueprint | ⏳ |
| Native Home Assistant Integration | ⏳ |

---

# Version 1.0 – Reference Implementation

## Goal

Develop a complete reference implementation based on a **Trotec TTK 171 ECO**.

## Features

- Operating modes
- Humidity profiles
- Control characteristics
- Target modes
- Automatic operation
- Timed operation
- Dashboard
- Template sensors
- Device configuration
- Operating status
- Power monitoring
- Energy monitoring
- Documentation

**Status**

🟡 In Progress

---

# Version 1.1 – Automation Blueprint

## Goal

Transform the reference implementation into a reusable Home Assistant blueprint.

## Planned Features

- Flexible sensor selection
- Flexible switching device selection
- Automatic provisioning of required framework components
- Preconfigured dashboard
- Reusable with different dehumidifiers

**Status**

⚪ Planned

---

# Version 2.0 – Native Home Assistant Integration

## Goal

Develop a native Home Assistant integration.

## Planned Features

- Config Flow
- Options Flow
- Device management
- Device configuration
- Humidity profile management
- Automatic entity creation
- Dashboard generation
- Integrated control logic
- Framework diagnostics

**Status**

⚪ Planned

---

# Version 3.0 – Advanced Humidity Control

## Planned Features

- Outdoor climate
- Outdoor dew point
- Indoor/outdoor dew point comparison
- Ventilation recommendations
- Condensation assessment
- Mold risk assessment
- Building drying mode

**Status**

⚪ Vision

---

# Version 4.0 – Smart Humidity Control

## Planned Features

- Adaptive control algorithms
- Learning humidity profiles
- Energy optimization
- Multiple humidity reduction strategies
- Multiple switching devices
- Ventilation systems
- Fans
- Window actuators
- Tank level estimation
- Tank level sensor support

**Status**

⚪ Vision

---

# Long-Term Vision

The Smart Humidity Control Framework is intended to become a universal platform for intelligent humidity control in Home Assistant.

The framework architecture shall remain independent of manufacturers, devices, and sensors while supporting different humidity reduction strategies.

Its core principle is a modular, transparent, understandable, and extensible control architecture that can continuously evolve without changing its fundamental design.
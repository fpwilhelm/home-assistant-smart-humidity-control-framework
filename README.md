# Home Assistant Smart Humidity Control Framework

A modular framework for intelligent humidity control in Home Assistant.

The Smart Humidity Control Framework provides a reusable and extensible architecture for controlling dehumidifiers and other humidity-related actuators using humidity profiles, protection levels, hysteresis-based control and multiple operating modes.

Unlike traditional humidity automations, the framework separates configuration, control logic and visualization into clearly defined layers. This allows the same control algorithm to be reused across different devices, installations and future implementations.

The long-term goal is to evolve from a Home Assistant reference implementation into a fully featured native Home Assistant integration.

---

# Features

## Current Features

- Automatic humidity control
- Continuous mode
- Timed mode
- Humidity profiles
- Protection levels
- Target modes
- Hysteresis-based control
- Dashboard
- Device configuration
- Power and energy monitoring
- Modular architecture

---

# Project Architecture

The project is developed in several stages.

```text
Reference Implementation
            │
            ▼
Automation Blueprint
            │
            ▼
Native Home Assistant Integration
            │
            ▼
Advanced Smart Humidity Control
```

The control algorithm remains identical across all implementation levels.

---

# Current Project Status

| Component | Status |
|-----------|:------:|
| Project Architecture | ✅ |
| Documentation | ✅ |
| Reference Implementation | ✅ |
| Automation Blueprint | 🚧 In Progress |
| Native Integration | ⏳ Planned |

---

# Repository Structure

```text
assets/
blueprints/
custom_components/
dashboards/
docs/
examples/
```

---

# Documentation

Documentation is available in multiple languages.

## German

- Architecture
- Control Algorithm
- Controller Reference
- Automation Blueprint
- Dashboard Design
- Device Configuration
- Helper Entities
- Humidity Profiles
- Integration Design
- Installation Guide
- Template Sensors

English documentation is currently being prepared.

---

# Design Principles

The Smart Humidity Control Framework follows five fundamental principles.

- Device independent
- Modular
- Transparent
- Extensible
- Easy to understand

---

# Long-Term Vision

The framework is designed to become a universal humidity control platform for Home Assistant.

Future versions are planned to support:

- multiple dehumidifiers
- ventilation systems
- fans
- window actuators
- dew point control
- mould prevention
- building physics evaluation
- adaptive control strategies
- energy optimization

without changing the underlying control algorithm.

---

# Roadmap

The development roadmap is documented in:

- `ROADMAP.md`

---

# License

The license will be added before the first public release.
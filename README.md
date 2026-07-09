# Home Assistant Smart Humidity Control Framework

> **⚠ Development Status**
>
> The Smart Humidity Control Framework (SHCF) is currently in an early development stage (**v0.2.0 – Development**).
>
> The project is being developed and tested privately. It is not yet intended for production use or public deployment.
>
> The current focus is on stabilizing the framework architecture before releasing the first reusable Automation Blueprint and, later, a native Home Assistant integration.

A modular framework for intelligent humidity control in Home Assistant.

The Smart Humidity Control Framework (**SHCF**) provides a reusable and extensible architecture for controlling dehumidifiers using humidity profiles, control characteristics, hysteresis-based control, and multiple operating modes.

The framework separates configuration, calculated values, control logic, diagnostics, recommendations, and visualization into clearly defined layers. This allows the same control concept to be reused across different devices, installations, blueprints, and a future native Home Assistant integration.

The long-term goal is to evolve from a Home Assistant reference implementation into a reusable humidity control framework, providing Automation Blueprints, a native Home Assistant integration, and support for future humidity control strategies.

---

# Features

## Current Features

* Automatic humidity control
* Continuous operation
* Timed operation
* Humidity profiles
* Control characteristics
* Target modes
* Multiple operating modes
* Hysteresis-based control
* Reference dashboard
* Device configuration
* Power and energy monitoring
* Modular package architecture
* German and English documentation

---

# Reference Hardware Concept

The current SHCF reference implementation assumes the following hardware setup:

* A dehumidifier that resumes operation automatically after power is restored and supports continuous operation
* A temperature and humidity sensor, either combined or as separate sensors
* A switchable plug with power and energy measurement

This setup is used as the reference hardware concept for the current Home Assistant package and the first planned SHCF Automation Blueprint.

SHCF is not limited to switchable plugs. In principle, any Home Assistant compatible switching device can be used, for example:

* smart plugs
* in-wall switch actuators
* smart relays
* DIN rail relays
* contactors
* other Home Assistant compatible switch outputs

The minimum technical requirement is that the connected dehumidifier can be switched on and off through Home Assistant.

A switchable plug with power and energy measurement is currently recommended because it provides additional diagnostic data. These values are already used for dashboard display and may later be used for features such as tank status detection, energy optimization, efficiency evaluation, and fault detection.

If power or energy measurement is not available, the basic humidity control logic can still work, but related monitoring and diagnostic features will not be available.

---

# Project Architecture

The project is developed in several stages.

```text
Proof of Concept (v0.1)
          │
          ▼
Modular Framework (v0.2)
          │
          ▼
Reusable Automation Blueprint (v0.3)
          │
          ▼
Multi-Instance Support (v0.4)
          │
          ▼
Native Home Assistant Integration (v0.5+)
          │
          ▼
Stable SHCF Release (v1.0)
```

The core control concept remains consistent across all implementation levels.

---

# Current Project Status

| Component              |   Status  |
| ---------------------- | :-------: |
| Framework Architecture |     ✅     |
| Documentation          |     ✅     |
| Home Assistant Package |     ✅     |
| Automation Blueprint   | ⏳ Planned |
| Native Integration     | ⏳ Planned |

---

# Repository Structure

```text
blueprints/
docs/
  ├── de/
  └── en/
packages/
  └── shcf/
      ├── core/
      └── dashboard/
CHANGELOG.md
LICENSE
README.md
ROADMAP.md
TODO.md
```

---

# Documentation

The complete documentation is available in both German and English.

## German

* [Documentation Index](docs/de/index.md)
* [Architecture](docs/de/architecture.md)
* [Glossary](docs/de/glossary.md)
* [Integration Design](docs/de/integration_design.md)
* [Control Algorithm](docs/de/control_algorithm.md)
* [Controller Reference](docs/de/controller_reference.md)
* [Humidity Profiles](docs/de/humidity_profiles.md)
* [Device Configuration](docs/de/device_configuration.md)
* [Helper Entities](docs/de/helper_entities.md)
* [Template Sensors](docs/de/template_sensors.md)
* [Dashboard Design](docs/de/dashboard_design.md)
* [Automation Blueprint](docs/de/automation_blueprint.md)
* [Installation Guide](docs/de/installation_guide.md)
* [Coding Guidelines](docs/de/coding_guidelines.md)

## English

* [Documentation Index](docs/en/index.md)
* [Architecture](docs/en/architecture.md)
* [Glossary](docs/en/glossary.md)
* [Integration Design](docs/en/integration_design.md)
* [Control Algorithm](docs/en/control_algorithm.md)
* [Controller Reference](docs/en/controller_reference.md)
* [Humidity Profiles](docs/en/humidity_profiles.md)
* [Device Configuration](docs/en/device_configuration.md)
* [Helper Entities](docs/en/helper_entities.md)
* [Template Sensors](docs/en/template_sensors.md)
* [Dashboard Design](docs/en/dashboard_design.md)
* [Automation Blueprint](docs/en/automation_blueprint.md)
* [Installation Guide](docs/en/installation_guide.md)
* [Coding Guidelines](docs/en/coding_guidelines.md)

---

# Design Principles

The Smart Humidity Control Framework follows these fundamental principles.

* Manufacturer independent
* Modular
* Transparent
* Extensible
* Easy to understand
* Separation of domain logic and implementation
* Separation of measured values, diagnostics, recommendations, control logic, and visualization

---

# Terminology

## Multi-Instance Support

Multi-Instance Support means that multiple independent SHCF instances can be created.

Each SHCF instance represents one hardware unit, typically consisting of:

* one dehumidifier
* one switching device
* one temperature and humidity sensor, either combined or separate
* one set of helper entities
* one set of template sensors
* one dashboard instance

Examples:

* SHCF Basement
* SHCF Living Room
* SHCF Pool Room

These instances operate independently from each other.

## Multi-Device Control

Multi-Device Control means that one SHCF instance coordinates multiple devices within the same control task, for example multiple dehumidifiers in one large room or a combination of dehumidifiers, fans, ventilation systems, and multiple sensors.

This is not part of the current development stage and is considered a future extension after the first stable SHCF release.

---

# Long-Term Vision

The framework is designed to become a reusable humidity control platform for Home Assistant.

Future versions are planned to support additional humidity reduction strategies, including

* multiple independent SHCF instances
* multiple dehumidifiers
* ventilation systems
* fans
* window control
* dew point control
* mold prevention
* building physics evaluation
* adaptive control strategies
* energy optimization

without changing the underlying framework architecture.

---

# Roadmap

The project roadmap is documented in

* [ROADMAP.md](ROADMAP.md)

---

# Contributing

The project is currently developed privately.

Public contributions will be considered once the first reusable Automation Blueprint has been released.

---

# License

This project is licensed under the MIT License.

See [LICENSE](LICENSE) for details.

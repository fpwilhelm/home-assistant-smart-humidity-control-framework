# Home Assistant Smart Humidity Control Framework

A modular framework for intelligent humidity control in Home Assistant.

The Smart Humidity Control Framework provides a reusable and extensible architecture for controlling dehumidifiers using humidity profiles, control characteristics, hysteresis-based control, and multiple operating modes.

The framework separates configuration, calculated values, control logic, and visualization into clearly defined layers. This allows the same control concept to be reused across different devices, installations, blueprints, and a future native Home Assistant integration.

The long-term goal is to evolve from a Home Assistant reference implementation into a fully featured native Home Assistant integration.

---

# Features

## Current Features

- Automatic humidity control
- Continuous operation
- Timed operation
- Humidity profiles
- Control characteristics
- Target modes
- Multiple operating modes
- Hysteresis-based control
- Reference dashboard
- Device configuration
- Power and energy monitoring
- Modular architecture
- German and English documentation

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

The core control concept remains consistent across all implementation levels.

---

# Current Project Status

| Component | Status |
|----------|:------:|
| Project Architecture | ✅ |
| Documentation | ✅ |
| Reference Implementation | ✅ |
| Automation Blueprint | 🚧 In Progress |
| Native Integration | ⏳ Planned |

---

# Repository Structure

```text
blueprints/
docs/
  ├── de/
  └── en/
CHANGELOG.md
LICENSE
README.md
ROADMAP.md
```

---

# Documentation

The complete documentation is available in both German and English.

## German

- [Documentation Index](docs/de/index.md)
- [Architecture](docs/de/architecture.md)
- [Glossary](docs/de/glossary.md)
- [Integration Design](docs/de/integration_design.md)
- [Control Algorithm](docs/de/control_algorithm.md)
- [Controller Reference](docs/de/controller_reference.md)
- [Humidity Profiles](docs/de/humidity_profiles.md)
- [Device Configuration](docs/de/device_configuration.md)
- [Helper Entities](docs/de/helper_entities.md)
- [Template Sensors](docs/de/template_sensors.md)
- [Dashboard Design](docs/de/dashboard_design.md)
- [Automation Blueprint](docs/de/automation_blueprint.md)
- [Installation Guide](docs/de/installation_guide.md)
- [Coding Guidelines](docs/de/coding_guidelines.md)

## English

- [Documentation Index](docs/en/index.md)
- [Architecture](docs/en/architecture.md)
- [Glossary](docs/en/glossary.md)
- [Integration Design](docs/en/integration_design.md)
- [Control Algorithm](docs/en/control_algorithm.md)
- [Controller Reference](docs/en/controller_reference.md)
- [Humidity Profiles](docs/en/humidity_profiles.md)
- [Device Configuration](docs/en/device_configuration.md)
- [Helper Entities](docs/en/helper_entities.md)
- [Template Sensors](docs/en/template_sensors.md)
- [Dashboard Design](docs/en/dashboard_design.md)
- [Automation Blueprint](docs/en/automation_blueprint.md)
- [Installation Guide](docs/en/installation_guide.md)
- [Coding Guidelines](docs/en/coding_guidelines.md)

---

# Design Principles

The Smart Humidity Control Framework follows these fundamental principles.

- Manufacturer independent
- Modular
- Transparent
- Extensible
- Easy to understand
- Separation of domain logic and implementation

---

# Long-Term Vision

The framework is designed to become a reusable humidity control platform for Home Assistant.

Future versions are planned to support additional humidity reduction strategies, including

- multiple dehumidifiers
- ventilation systems
- fans
- window control
- dew point control
- mold prevention
- building physics evaluation
- adaptive control strategies
- energy optimization

without changing the underlying framework architecture.

---

# Roadmap

The project roadmap is documented in

- [ROADMAP.md](ROADMAP.md)

---

# Contributing

The project is currently under active development.

Suggestions, discussions, bug reports, and future contributions are welcome.

---

# License

This project is licensed under the MIT License.

See [LICENSE](LICENSE) for details.
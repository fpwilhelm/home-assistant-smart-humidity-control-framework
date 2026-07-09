# Coding Guidelines

## Purpose

This document defines the development guidelines of the Smart Humidity Control Framework.

It describes the common principles for architecture, implementation, documentation, and long-term project development.

These guidelines ensure a consistent, maintainable, and extensible framework across all implementations.

---

# General Principles

All development within the project follows the same principles.

- Simplicity before complexity
- Readability before optimization
- Consistency before individual preference
- Modularity before duplication
- Framework before implementation
- Domain logic before manufacturer-specific logic

Every change should improve the long-term quality of the framework.

---

# Architecture

The framework consists of clearly separated components.

```text
Device Configuration

        │

        ▼

Humidity Profiles

        │

        ▼

Template Sensors

        │

        ▼

Controller

        │

        ▼

Dashboard

        │

        ▼

Blueprint

        │

        ▼

Native Integration
```

Each component has exactly one clearly defined responsibility.

---

# Responsibilities

## Device Configuration

Describes only the properties of the connected devices.

Contains no control logic.

---

## Humidity Profiles

Define the desired room climate.

Contain no device-specific information.

---

## Template Sensors

Perform all calculations.

Template Sensors calculate values.

They never make decisions.

---

## Controller

The controller evaluates previously calculated values only.

It decides whether actions are required.

The controller should never perform calculations that belong in Template Sensors.

---

## Dashboard

The dashboard visualizes information.

It contains no control logic.

---

# Separation of Responsibilities

Each component has exactly one responsibility.

| Component | Responsibility |
|-----------|----------------|
| Device Configuration | Device properties |
| Helpers | User configuration |
| Template Sensors | Calculations |
| Controller | Decisions |
| Dashboard | Visualization |

Responsibilities should never overlap.

---

# Naming

Consistent terminology is an essential part of the framework.

## Documentation

Documentation uses descriptive technical terms.

Examples

- Relative Humidity
- Target Humidity
- Humidity Profile
- Control Characteristic

---

## Source Code

Source code should use concise and consistent identifiers.

Examples

```text
target_humidity
relative_humidity
humidity_profile
control_characteristic
device_configuration
```

Avoid abbreviations unless they are well established.

---

## Entity IDs

Entity IDs should be

- descriptive
- stable
- as manufacturer-independent as possible

Device-specific entity IDs belong exclusively to the reference implementation.

Blueprints and future integrations should use generic configurations.

---

# Documentation

Documentation is considered part of the source code.

Every significant architectural decision should be documented.

Examples must always remain synchronized with the implementation.

The project documentation is currently maintained in English only.

Additional language versions may be introduced once the framework architecture has stabilized.

---

# Comments

Comments should explain

- why a solution was chosen,

not

- what the code does.

Well-structured code should explain itself whenever possible.

---

# Home Assistant

The framework follows Home Assistant best practices whenever possible.

This includes

- Blueprint conventions
- Integration architecture
- Entity naming
- Configuration flows
- Translation system

---

# Internationalization

During active development, the official project documentation is maintained in English only.

Additional language versions may be added after the first reusable Automation Blueprint has been completed and the framework architecture has become sufficiently stable.

---

# Extensibility

New functionality should extend existing concepts.

Parallel or competing concepts should be avoided whenever possible.

Examples include

- new humidity profiles
- new control strategies
- additional sensors
- additional device types

without fundamentally changing the existing architecture.

---

# Manufacturer Independence

The framework describes general concepts rather than specific products.

Preferred terms

```text
Dehumidifier
Switching Device
Temperature Sensor
Humidity Sensor
```

Manufacturer names such as

```text
Trotec
Shelly
Ecowitt
```

belong exclusively to the reference implementation.

---

# Reference Implementation

The reference implementation demonstrates the framework architecture.

It serves as the foundation for

- documentation
- blueprint
- future native integration

All implementations should behave consistently.

---

# Version Control

Development should follow a clean Git workflow.

Recommended practices include

- small commits
- meaningful commit messages
- separating features from bug fixes
- code reviews before merging

---

# Git Commit Messages

SHCF follows a simplified Conventional Commit style to keep the Git history clear and consistent.

The following commit prefixes should be used whenever applicable.

| Prefix | Purpose |
|---------|---------|
| `docs:` | Documentation changes |
| `feat:` | New functionality |
| `fix:` | Bug fixes |
| `refactor:` | Code restructuring without functional changes |
| `test:` | Test-related changes |
| `ci:` | Continuous Integration |
| `build:` | Build and packaging changes |

## Examples

```text
docs: reorganize project documentation for v0.2 development

feat: add drying mode

fix: correct operating status detection

refactor: split template sensors into dedicated files
```

---

# Quality

Every change should improve at least one of the following.

- readability
- maintainability
- modularity
- usability
- documentation

Changes that only increase complexity should be avoided.

---

# Future

These guidelines will continue to evolve together with the framework.

Planned additions include

- Python-specific coding conventions
- automated testing
- continuous integration
- test coverage
- performance guidelines
- release process

---

# Summary

The Coding Guidelines define the common development principles of the Smart Humidity Control Framework.

They ensure that documentation, the reference implementation, the Automation Blueprint, and the future native Home Assistant integration evolve consistently over time.

Readability, modularity, manufacturer independence, and maintainability remain the guiding principles of the project.
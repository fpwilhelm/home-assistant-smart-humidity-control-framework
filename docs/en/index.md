# Documentation Index

Welcome to the documentation of the **Smart Humidity Control Framework**.

This document serves as the central entry point to the project documentation and provides an overview of the framework structure, available documents, and the recommended reading order.

---

# Documentation Structure

The documentation is organized into five main sections.

```text
Smart Humidity Control Framework

│

├── Getting Started

├── Architecture

├── Framework

├── Home Assistant

└── Development
```

---

# Getting Started

These documents provide a quick introduction to the project.

| Document | Description |
|----------|-------------|
| README.md | Project overview, objectives, and features |

---

# Architecture

These documents describe the conceptual architecture of the framework.

| Document | Description |
|----------|-------------|
| architecture.md | Overall framework architecture |
| glossary.md | Standardized terminology |
| integration_design.md | Architecture of the future Home Assistant integration |

---

# Framework

These documents describe the core control logic of the framework.

| Document | Description |
|----------|-------------|
| control_algorithm.md | Logical control algorithm |
| controller_reference.md | Responsibilities of the controller |
| humidity_profiles.md | Standardized humidity profiles |
| device_configuration.md | Supported device requirements and properties |

---

# Home Assistant

These documents describe the current reference implementation.

| Document | Description |
|----------|-------------|
| helper_entities.md | User configuration using Home Assistant helpers |
| template_sensors.md | Calculated framework sensors |
| dashboard_design.md | Reference dashboard design |
| automation_blueprint.md | Home Assistant blueprint |
| installation_guide.md | Installation and migration |

---

# Development

These documents are primarily intended for developers.

| Document | Description |
|----------|-------------|
| coding_guidelines.md | Development principles and project standards |

---

# Framework Architecture

The documentation follows the same layered architecture as the framework itself.

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

Native Home Assistant Integration
```

Each layer has a clearly defined responsibility and builds upon the layers below it.

---

# Recommended Reading Order

## For Users

1. README
2. Installation Guide
3. Dashboard Design
4. Humidity Profiles

These documents provide everything needed to install and operate the framework.

---

## For Developers

1. README
2. Architecture
3. Glossary
4. Integration Design
5. Control Algorithm
6. Controller Reference
7. Device Configuration
8. Humidity Profiles
9. Template Sensors
10. Helper Entities
11. Dashboard Design
12. Automation Blueprint
13. Coding Guidelines

This order introduces the conceptual design first, followed by the technical implementation.

---

# Project Evolution

The documentation describes three stages of the project.

## Reference Implementation

The current Home Assistant implementation serves as the foundation for development, testing, and documentation.

---

## Automation Blueprint

The blueprint provides the first installable version of the framework.

It is fully based on the reference implementation.

---

## Native Home Assistant Integration

In the long term, the framework will be available as a native Home Assistant integration.

The integration will automatically create and manage all required framework components.

---

# Documentation Principles

The entire documentation follows common principles.

- Clear separation between domain logic and implementation
- Consistent terminology
- Manufacturer independence
- Modularity
- Extensibility
- German and English documentation remain functionally identical

---

# Summary

The Smart Humidity Control Framework documentation describes the conceptual foundations, the current reference implementation, and the future evolution of the project.

This document serves as the central entry point for both users and developers, helping them quickly find the information relevant to their needs.
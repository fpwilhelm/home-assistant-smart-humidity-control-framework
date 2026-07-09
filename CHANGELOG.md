# Changelog

All notable changes to the **Smart Humidity Control Framework (SHCF)** are documented in this file.

The project follows the principles of [Keep a Changelog](https://keepachangelog.com/) and uses Semantic Versioning.

---

## v0.2.0 (Development)

### Architecture

- Introduced a modular SHCF package architecture
- Split the framework into templates, automations, and helpers
- Prepared the project for further modularization
- Evolved from a single automation into a reusable framework
- Introduced the SHCF Device Profile architecture
- Separated hardware configuration from SHCF Core logic
- Started the transition towards portable multi-device provisioning

### Home Assistant

#### Operating Modes

- Automatic
- Continuous Operation
- Timed Operation
- Off

#### Sensors

- Target Humidity
- Hysteresis
- Switch-on Threshold
- Target Dew Point
- Indoor Dew Point
- Humidity Deviation
- Dehumidification Demand
- Recommendation
- Operating Status
- Operating Status Indicator

#### Controller

- Central SHCF controller
- Timed Operation
- Automatic return to Automatic mode
- Adjustable timer during runtime

#### Dashboard

- Initial SHCF dashboard
- Operating Status
- Timed Operation
- Recommendations
- Prototype dashboard generator

### Device Provisioning

- Introduced SHCF Device Profiles
- Implemented first device package generator
- Automatic generation of:
  - Home Assistant helpers
  - Template sensors
  - Timers
  - Controller automation
- First prototype dashboard generation
- Successfully generated and loaded the first SHCF device package

### Reference Hardware

- Added optional battery sensor support
- Extended portable hardware abstraction

### Repository

- Created GitHub repository
- Added English project documentation
- Created glossary
- Added roadmap
- Added continuously maintained development backlog
- Synchronized Home Assistant configuration with the local repository

---

## v0.1.0

### Proof of Concept

First functional Home Assistant implementation demonstrating the SHCF control concept.

Included:

- Automatic humidity control
- Target humidity regulation
- Initial dashboard
- First template sensors
- First automations

---

## Planned Releases

| Version | Description |
|----------|-------------|
| v0.3.0 | SHCF Instance Provisioning |
| v0.4.0 | Multi-Instance Support |
| v0.5.0 | Native Home Assistant Integration |
| v1.0.0 | First Stable SHCF Release |
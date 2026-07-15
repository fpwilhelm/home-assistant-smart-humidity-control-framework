# Changelog

All notable changes to the **Smart Humidity Control Framework (SHCF)** are documented in this file.

The project follows the principles of **Keep a Changelog** and uses **Semantic Versioning**.

---

## v0.3.0 (Development)

### Architecture

- Introduced the SHCCF Climate Laboratory as a dedicated analysis environment
- Started the modular Analysis Framework architecture
- Split the analysis into independent modules:
  - Common
  - Analytics
  - Diagnostics
  - Recommendations
  - Experiment
- Continued separating reusable framework components from use-case specific functionality
- Improved overall package modularization

### Experiment Module

- Introduced the first Experiment Lifecycle
- Added experiment phases
- Added experiment status tracking
- Added experiment duration calculation
- Added experiment energy consumption calculation
- Added experiment start and finish automations
- Added experiment metadata helpers
- Added experiment timeline
- Added preparation for future experiment lifecycle extensions

### Climate Laboratory Dashboard

- Expanded the dashboard to seven dedicated views:
  - Overview
  - Measurements
  - Analytics
  - Diagnostics
  - Recommendations
  - Experiment
  - Weather
- Added Experiment Lifecycle section
- Added Experiment Timeline
- Added Building Investigation workflow
- Added Weekly Trends
- Improved controller visualization
- Improved experiment visualization

### Analytics

- Introduced the Analytics module
- Added weekly runtime statistics
- Added weekly energy statistics
- Added humidity exposure statistics
- Added Utility Meter integration
- Added rolling experiment statistics

### Diagnostics

- Introduced the Diagnostics module
- Prepared climate diagnosis architecture
- Added initial diagnostic dashboard
- Prepared future root-cause analysis

### Recommendations

- Introduced the Recommendations module
- Added recommendation dashboard
- Prepared context-aware recommendation engine

### Documentation

- Added Experiment Lifecycle design documentation
- Improved project architecture documentation
- Continued documenting long-term framework architecture
- Extended developer documentation
- Continued glossary refinement

### Design Decisions

- Experiment start records only:
  - Start timestamp
  - Initial energy meter reading
  - Current experiment phase
  - Active state
- Experiment completion records only:
  - Finish timestamp
  - Final energy meter reading
  - Completed state
- Planned "Adopt Existing Experiment"
- Planned automatic retrieval of historical energy readings from Home Assistant Recorder/History
- Planned experiment pause and resume lifecycle

---

## v0.2.0

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
| v0.4.0 | SHCF Instance Provisioning |
| v0.5.0 | Multi-Instance Support |
| v0.6.0 | Native Home Assistant Integration |
| v1.0.0 | First Stable SHCF Release |
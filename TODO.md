# SHCF Development Backlog

> This document represents the current development backlog of the **Smart Humidity Control Framework (SHCF)**.
>
> Unlike the roadmap, this file is intentionally work-in-progress and evolves continuously during development.
>
> **Current Development Target:** **v0.2.0 – Modular Development Platform**

---

# Current Development Status

## Overall Status

* 🟢 Home Assistant Package running in productive testing
* 🟢 Modular package architecture implemented
* 🟢 Local repository synchronized with Home Assistant
* 🟢 GitHub repository established
* 🟡 Documentation under continuous refinement
* 🟢 SHCF Device Profile architecture defined
* 🟢 First package generator prototype implemented
* 🟡 Dashboard generator prototype under development
* 🔵 Native Home Assistant Integration not yet started

---

# Planned Releases

* [x] v0.1.0 – Proof of Concept
* [ ] v0.2.0 – Modular Development Platform
* [ ] v0.3.0 – SHCF Instance Provisioning
* [ ] v0.4.0 – Multi-Instance Support
* [ ] v0.5.0 – Native Home Assistant Integration
* [ ] v1.0.0 – First Stable SHCF Release

---

# Repository

## Documentation

* [ ] Review README
* [ ] Review ROADMAP
* [ ] Review CHANGELOG
* [ ] Finalize TODO
* [ ] Update installation guide
* [ ] Extend developer documentation
* [ ] Review coding conventions

## Repository Maintenance

* [ ] Review .gitignore
* [ ] Decide generated-files policy
* [ ] Clean repository structure
* [ ] Synchronize GitHub repository

---

# Deployment

* [x] Deployment script (Mac → Home Assistant)
* [x] Manual deployment of generated SHCF packages
* [ ] Synchronization script (Home Assistant → Mac)
* [ ] Automatic synchronization
* [ ] Automatic backup before deployment

---

# SHCF Core

## Templates

* [x] Basic template modularization
* [ ] Split templates into dedicated topic files
  * target_humidity.yaml
  * hysteresis.yaml
  * dewpoint.yaml
  * demand.yaml
  * recommendations.yaml
  * operating_status.yaml

## Automations

* [x] Basic automation modularization
* [ ] Split automations into dedicated topic files
  * controller.yaml
  * timed_operation.yaml
  * operating_mode.yaml

## Helpers

* [x] Basic helper modularization
* [ ] Review helper structure
* [ ] Reduce helper dependencies

---

# SHCF Device Architecture

* [x] Define SHCF Device Profile concept
* [x] Separate hardware configuration from SHCF Core
* [x] Define SHCF Device Profile format
* [x] Create first SHCF Device Profile
* [x] Implement package generator prototype
* [x] Generate first Home Assistant device package
* [x] Load generated package in Home Assistant
* [x] Verify generated helpers
* [x] Verify generated timer
* [x] Verify generated automations
* [x] Verify generated template sensors
* [x] Implement dashboard generator prototype
* [ ] Resolve generated template sensor entity-ID strategy
* [ ] Improve generated dashboard template
* [ ] Automatically register generated dashboards
* [ ] Test complete second portable SHCF device
* [ ] Test multiple independent SHCF devices

---

# Home Assistant Package

* [x] Package architecture
* [x] Includes
* [x] Modular templates
* [x] Modular automations
* [x] Modular helpers
* [x] Dashboard integration
* [ ] Documentation update

---

# Reference Hardware

* [x] Continuous-operation dehumidifier
* [x] Temperature / humidity sensor
* [x] Smart plug with power and energy measurement
* [x] Optional battery sensor support
* [ ] Native relay support
* [ ] Alternative switching devices

---

# Automation Blueprint

* [ ] Re-evaluate the role of the Automation Blueprint
* [ ] Decide whether the Blueprint remains part of the SHCF architecture

---

# Native Home Assistant Integration

* [ ] Config Flow
* [ ] Options Flow
* [ ] Device Registry
* [ ] Entity Registry
* [ ] Automatic entity discovery
* [ ] Multiple SHCF instances
* [ ] Migration from generated packages

---

# Architecture

## Layer 1 – Measurements

* [x] Relative Humidity
* [x] Temperature
* [x] Target Humidity
* [x] Indoor Dew Point
* [x] Power
* [x] Energy
* [x] Battery Level (optional)

## Layer 2 – Diagnostics

* [x] Operating Status
* [x] Dehumidification Demand
* [x] Recommendation
* [ ] Runtime Statistics
* [ ] Tank Status
* [ ] Estimated Tank Level
* [ ] Mold Risk
* [ ] Dew Point Evaluation

## Layer 3 – Recommendations

* [x] Recommendation
* [ ] Energy Optimization
* [ ] Ventilation Recommendation
* [ ] Weather Recommendation
* [ ] Mold Warning

---

# Tank Operation

* [ ] Estimate tank filling level
* [ ] Tank full detection using power consumption
* [ ] Optional tank level sensor
* [ ] Continuous drainage support

---

# Operating Modes

* [x] Off
* [x] Automatic
* [x] Continuous Operation
* [x] Timed Operation
* [x] Adjustable timer during runtime
* [x] Automatic return to Automatic mode after timeout
* [ ] Drying Mode / Water Damage Mode

---

# Control Strategy

* [ ] Outdoor dew point integration
* [ ] Weather forecast integration
* [ ] Dynamic target humidity
* [ ] Seasonal control strategies
* [ ] Room-specific control strategies

---

# Dashboard

* [x] Initial dashboard exists in Home Assistant
* [x] Dashboard generator prototype
* [ ] Export reference dashboard YAML
* [ ] Dashboard Version 1.0
* [ ] Dynamic gauge generation
* [ ] Target range visualization
* [ ] Animated dehumidification indicator
* [ ] Extended operating status
* [ ] Automatic dashboard deployment
* [ ] Multiple dashboard instances
* [ ] SHCF overview dashboard

---

# Future Multi-Device Control

These features are intentionally planned **after the first stable SHCF release**.

Possible future topics include:

* Coordinated control of multiple dehumidifiers
* Combined control of dehumidifiers and ventilation systems
* Multiple sensors per SHCF device
* Device prioritization
* Load balancing
* Energy-aware device coordination

---

# Long-Term Goals

* [ ] Prepare HACS repository
* [ ] Publish Automation Blueprint (if retained)
* [ ] Publish native Home Assistant Integration
* [ ] GitHub Pages documentation
* [ ] First public community release
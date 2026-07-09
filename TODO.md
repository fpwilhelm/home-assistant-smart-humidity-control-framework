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
* 🟡 SHCF instance architecture under design
* 🔵 Native Home Assistant Integration not yet started

---

# Planned Releases

* [x] v0.1.0 – Proof of Concept
* [ ] v0.2.0 – Modular Development Platform (current development)
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
* [ ] Clean repository structure
* [ ] Synchronize GitHub repository

---

# Deployment

* [x] Deployment script (Mac → Home Assistant)
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

# SHCF Instance Architecture

* [ ] Design SHCF instance architecture
* [ ] Separate instance configuration from SHCF core
* [ ] Define reusable instance configuration format
* [ ] Implement SHCF instance generator
* [ ] Test second portable SHCF instance

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

---

# Architecture

## Layer 1 – Measurements

* [x] Relative Humidity
* [x] Temperature
* [x] Target Humidity
* [x] Indoor Dew Point
* [x] Power
* [x] Energy

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
* [ ] Export dashboard YAML to repository
* [ ] Dashboard Version 1.0
* [ ] Target range visualization
* [ ] Animated dehumidification indicator
* [ ] Extended operating status
* [ ] Multiple dashboard instances
* [ ] SHCF overview dashboard

---

# Future Multi-Device Control

These features are intentionally planned **after the first stable SHCF release**.

Possible future topics include:

* Coordinated control of multiple dehumidifiers
* Combined control of dehumidifiers and ventilation systems
* Multiple sensors per SHCF instance
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
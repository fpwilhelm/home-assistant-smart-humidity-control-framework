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
* 🟢 Device package generator prototype implemented
* 🟢 Dashboard view generator implemented
* 🟢 Shared SHCF dashboard builder implemented
* 🟢 End-to-end deployment workflow implemented
* 🟡 Second generated SHCF device under functional testing
* 🔵 Native Home Assistant Integration not yet started

---

# Planned Releases

* [x] v0.1.0 – Proof of Concept
* [ ] v0.2.0 – Modular Development Platform
* [ ] v0.3.0 – SHCF Device Provisioning
* [ ] v0.4.0 – Multi-Device Support
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
* [ ] Document SHCF Device Profile architecture
* [ ] Document generator and deployment workflow
* [ ] Document shared dashboard architecture
* [ ] Document future device capability model

## Repository Maintenance

* [ ] Review .gitignore
* [x] Decide generated-files policy
  * Generated packages, views, and dashboards remain versioned in Git
* [ ] Clean repository structure
* [ ] Review and remove obsolete generator prototypes
* [ ] Synchronize GitHub repository

---

# Deployment

* [x] Deployment script (Mac → Home Assistant)
* [x] Manual deployment of generated SHCF packages
* [x] Automatic device package generation
* [x] Automatic dashboard view generation
* [x] Automatic shared dashboard generation
* [x] Automatic package deployment to Home Assistant
* [x] Automatic dashboard deployment to Home Assistant
* [x] Automatic Home Assistant configuration validation
* [x] Optional Home Assistant restart
* [ ] Automatically register generated packages in `configuration.yaml`
* [ ] Remove dependency on manual package includes
* [ ] Fully automatic deployment without manual Home Assistant changes
* [ ] Configure SSH key authentication for password-free deployment
* [ ] Add remote backup before device deployment
* [ ] Synchronization script (Home Assistant → Mac)
* [ ] Automatic synchronization
* [ ] Automatic backup retention and cleanup

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
* [ ] Add availability handling for unavailable source sensors
* [ ] Prevent fallback values from producing misleading measurements
* [ ] Standardize numeric precision and rounding

## Automations

* [x] Basic automation modularization
* [ ] Split automations into dedicated topic files
  * controller.yaml
  * timed_operation.yaml
  * operating_mode.yaml
* [ ] Compare generated controller behavior with the reference implementation
* [ ] Verify all operating modes for multiple independent devices

## Helpers

* [x] Basic helper modularization
* [ ] Review helper structure
* [ ] Reduce helper dependencies
* [ ] Verify generated helper defaults
* [ ] Prepare capability-dependent helper generation

---

# SHCF Device Architecture

* [x] Define SHCF Device concept
* [x] Define SHCF Device Profile concept
* [x] Separate hardware configuration from SHCF Core
* [x] Define initial SHCF Device Profile format
* [x] Create first SHCF Device Profile
* [x] Create second SHCF Device Profile
* [x] Include optional power sensor support
* [x] Include optional energy sensor support
* [x] Include optional battery sensor support
* [x] Implement device package generator prototype
* [x] Generate first Home Assistant device package
* [x] Load first generated package in Home Assistant
* [x] Verify generated helpers
* [x] Verify generated timer
* [x] Verify generated automation
* [x] Verify generated template sensors
* [x] Implement dashboard view generator
* [x] Implement shared SHCF dashboard builder
* [x] Generate multiple device views in one shared dashboard
* [x] Deploy generated package, view, and shared dashboard
* [ ] Finalize generated entity naming and unique ID strategy
* [ ] Automatically register generated packages
* [ ] Remove dependency on manual `configuration.yaml` edits
* [ ] Verify complete second portable SHCF device
* [ ] Test second device control in all operating modes
* [ ] Test independent simultaneous operation of multiple SHCF devices
* [ ] Replace the manual Trotec reference implementation with a generated SHCF device
* [ ] Remove obsolete reference entities after successful migration
* [ ] Remove obsolete manually maintained dashboard after successful migration
* [ ] Implement safe removal workflow for generated SHCF devices

---

# SHCF Device Generator

* [x] Read hardware entities from an SHCF Device Profile
* [x] Generate device-specific helpers
* [x] Generate device-specific timer
* [x] Generate device-specific template sensors
* [x] Generate device-specific controller automation
* [x] Generate device-specific dashboard view
* [x] Include the Device ID in generated object identifiers
* [x] Generate shared dashboard from all available device views
* [ ] Validate Device Profile schema before generation
* [ ] Validate required Home Assistant entity IDs
* [ ] Validate optional entities based on declared capabilities
* [ ] Handle absent optional sensors without invalid dashboard entities
* [ ] Generate only applicable dashboard sections
* [ ] Generate only applicable sensors, helpers, and automations
* [ ] Add generator version metadata
* [ ] Add migration support for changed generator templates
* [ ] Add dry-run mode
* [ ] Add overwrite confirmation and backup behavior
* [ ] Add generated-file consistency checks

---

# Device Capability Model

* [ ] Introduce capability-based SHCF Device Profiles
* [ ] Support device capabilities
  * dehumidification
  * ventilation
  * heating
  * cooling
  * air purification
* [ ] Extend Device Profiles with capability declarations

Example:

```yaml
capabilities:
  dehumidification: true
  ventilation: false
  heating: false
  cooling: false
  air_purification: false
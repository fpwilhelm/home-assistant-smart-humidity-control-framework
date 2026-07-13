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
* 🟢 Two generated SHCF devices successfully deployed and functionally verified
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
* [x] Implement separate Timed Operation lifecycle automation
* [x] Implement configurable behavior on target reached
* [x] Implement configurable behavior on timer finished
* [x] Verify different timer-finished behaviors on two independent devices
  * Trotec TTK 171 ECO → Switch to Automatic
  * Pro Klima ECO DRY → Turn Off
* [ ] Verify all target-reached behaviors
  * Continue Timed Operation
  * Switch to Automatic
  * Turn Off
* [ ] Verify mode changes while Timed Operation is active

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
* [x] Verify complete second portable SHCF device
* [ ] Complete regression test of all operating modes
* [ ] Test independent simultaneous operation of multiple SHCF devices
* [ ] Replace the manual Trotec reference implementation with a generated SHCF device
* [ ] Remove obsolete reference entities after successful migration
* [ ] Remove obsolete manually maintained dashboard after successful migration
* [ ] Implement safe removal workflow for generated SHCF devices
* [x] Verify independent timer-finished behavior on two generated SHCF devices
* [ ] Complete regression test of both generated devices
* [ ] Verify Humidity Profile target calculation for all profiles
* [ ] Verify Custom Target mode
* [ ] Verify Comfort, Standard, and Conservative control characteristics

---

# Environmental Analysis Dashboard

* [ ] Create a dedicated moisture-source analysis dashboard
* [ ] Record climate conditions in the former indoor pool area
* [ ] Record climate conditions in the adjoining room
* [ ] Record outdoor climate conditions at the south-west sensor location
* [ ] Record outdoor climate conditions at the north-east sensor location
* [ ] Calculate dew point for all relevant locations
* [ ] Calculate absolute humidity for all relevant locations
* [ ] Calculate indoor-to-outdoor absolute-humidity differences
* [ ] Correlate indoor humidity changes with:
  * Outdoor temperature
  * Outdoor humidity
  * Rain
  * Wind speed and direction
  * Air pressure
  * Dehumidifier operation and power consumption
* [ ] Add an experiment-phase helper
  * Dehumidification
  * Stabilization
  * Door Open
  * Door Closed
  * Ventilation Ducts Open
  * Ventilation Ducts Sealed
  * Observation
* [ ] Perform the first closed-door moisture-entry observation
* [ ] Compare open and temporarily sealed ventilation ducts


# SHCCF Evolution (Future Architecture)

The current SHCF architecture focuses primarily on humidity control through one dehumidification actuator.

Future versions shall evolve towards **SHCCF – Smart Humidity & Climate Control Framework** and a capability-based climate appliance architecture.

The long-term goal is to represent one logical climate appliance that coordinates multiple sensors and actuators.

## Project Evolution

* [ ] Evaluate the formal transition from SHCF to SHCCF
* [ ] Perform the project rename when the first heating or ventilation capability is implemented
* [ ] Preserve compatibility with existing dehumidification-only installations
* [ ] Document the migration path from SHCF Device Profiles to SHCCF Appliance Profiles

## Capability-Based Climate Appliance

Possible capabilities include:

* [x] Dehumidification
* [ ] Heating
* [ ] Ventilation
* [ ] Air circulation
* [ ] Cooling
* [ ] Air purification
* [ ] Outdoor climate integration
* [ ] Weather integration
* [ ] Mold prevention
* [ ] Energy optimization

Example capability configuration:

```yaml
capabilities:
  dehumidification: true
  heating: true
  ventilation: true
  air_circulation: false
```

A future SHCCF Appliance may consist of:

* Indoor humidity and temperature sensors
* Additional climate sensors
* Dehumidifier with switching actuator
* Electric heater with a separate switching actuator
* Ventilation fan controlled by a smart plug or distribution-board relay
* Outdoor climate sensors
* Additional capability-specific actuators

## Reference Scenario – Former Indoor Pool Area

Use the former indoor pool area as an extended SHCCF reference scenario.

The future appliance may coordinate:

* One dehumidifier
* One electric heater
* One separate heater switching actuator
* One future exhaust or ventilation fan
* One smart plug or distribution-board relay for ventilation control
* Indoor climate sensors
* Climate sensor in the adjoining room
* Two outdoor climate sensor locations
* Mold-prevention strategies
* Dew-point and absolute-humidity evaluation
* Energy-aware control
* Long-term moisture monitoring

The objective is to protect the large, partly underground room from moisture accumulation and mold while identifying relevant moisture-entry paths.

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
```

* [ ] Introduce capability-dependent actuator definitions
* [ ] Define SHCCF appliance structure
* [ ] Define actuator configuration model

---

# Experimental Validation

* [ ] Validate humidity ingress through former ventilation ducts
* [ ] Compare sealed vs. open ventilation ducts
* [ ] Validate absolute humidity calculations
* [ ] Validate dew-point-based moisture analysis
* [ ] Validate SHCCF climate-control strategies using the former indoor pool area
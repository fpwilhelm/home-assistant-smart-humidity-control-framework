# =============================================================================
# Smart Humidity Control Framework (SHCF)
# Engineering Backlog
# =============================================================================
#
# Version:
#   v0.3.0 – Analysis Framework
#
# Purpose:
#
#   This document serves as the central engineering backlog of the Smart
#   Humidity Control Framework (SHCF).
#
#   It is intentionally more than a traditional TODO list.
#
#   Besides implementation tasks it documents
#
#     • engineering priorities
#     • architectural decisions
#     • technical debt
#     • long-term roadmap items
#     • research topics
#
#   The objective is to preserve a consistent architecture while allowing
#   incremental development.
#
# =============================================================================

# Current Development Status

Project
: Smart Humidity Control Framework (SHCF)

Current Version
: v0.3.0 (Development)

Current Milestone
: Analysis Framework

Current Focus

- Climate Laboratory
- Experiment Lifecycle
- Analytics
- Diagnostics
- Recommendations
- Building Climate Analysis

Repository Status

- Private
- Early Development
- Architecture under active refinement

Development Philosophy

- Architecture before implementation
- Incremental development
- Stable interfaces
- Modular components
- Reusable building blocks
- Documentation-driven engineering

---

# Engineering Principles

The following principles guide all future development.

These principles have higher priority than individual feature requests.

## 1. Architecture before implementation

New functionality shall only be implemented after the architectural direction
has been defined.

Avoid feature-driven development.

Avoid isolated one-off solutions.

Whenever possible, implement reusable concepts.

---

## 2. Incremental Development

Large features are implemented in small,
fully working iterations.

Every milestone should produce a stable,
testable system.

Avoid "big bang" implementations.

---

## 3. Reusability

SHCF Core must remain reusable.

Use-case specific functionality belongs outside the Core.

Reference implementations should validate the framework,
not define it.

---

## 4. Separation of Concerns

The framework consists of independent modules.

SHCF Core

contains

- controller
- entities
- helpers
- automations
- blueprint
- integration

SHCF Analysis

contains

- analytics
- diagnostics
- recommendations
- experiments

Climate Laboratory

is a reference implementation built on top of SHCF Analysis.

---

## 5. Documentation First

Major architectural decisions shall be documented before implementation.

README

answers

"What is SHCF?"

ROADMAP

answers

"Where is SHCF going?"

CHANGELOG

answers

"What changed?"

TODO

answers

"What should be built next?"

Architecture documents

answer

"Why was this decision made?"

---

## 6. Backward Compatibility

Whenever practical,

existing installations should continue to work after framework updates.

Breaking changes should be avoided.

If unavoidable,

provide a migration path.

---

## 7. Modularization

Large YAML files should continuously be divided into
small,
well-defined modules.

Preferred architecture

templates/

automations/

helpers/

dashboard/

examples/

documentation/

tools/

---

## 8. Engineering Quality

Prefer

clarity

over cleverness.

Prefer

maintainability

over short code.

Prefer

consistency

over personal preference.

---

# Architecture Decisions

The following decisions are currently considered fixed.

Future development should build upon them.

## Project Name

The project remains

Smart Humidity Control Framework (SHCF)

until the framework supports additional climate-control capabilities beyond
humidity control.

The later transition to

Smart Home Climate Control Framework (SHCCF)

remains a planned long-term evolution.

---

## SHCF Analysis

Analysis is part of SHCF.

It is not an independent project.

It currently consists of

- Analytics
- Diagnostics
- Recommendations
- Experiment

---

## Climate Laboratory

The Climate Laboratory is

NOT

part of SHCF Core.

It is the primary reference implementation used to validate

- algorithms
- diagnostics
- experiment workflows
- user interface concepts

before they become reusable framework functionality.

---

## Device Evolution

Current architecture

Device

Future architecture

Climate Appliance

The transition will only occur after the concept has matured.

No immediate renaming is planned.

---

## Experiment Lifecycle

The following lifecycle has been adopted.

Draft

↓

Running

↓

Paused

↓

Running

↓

Completed

Future versions may support additional states if required.

---

## Historical Data

Historical experiment data should be obtained automatically from
Home Assistant Recorder / History.

Manual entry of historical measurements is considered
a temporary workaround only.

---

# Planned Releases

## v0.3.0

Current Development

Focus

- Analysis Framework
- Climate Laboratory
- Experiment Lifecycle
- Building Analysis

---

## v0.4.0

Planned

- Instance Provisioning
- Blueprint
- Appliance abstraction
- Dashboard generation

---

## v0.5.0

Planned

- Multi-instance support
- Appliance profiles
- Independent dashboards

---

## v0.6.0

Planned

Native Home Assistant Integration

- Config Flow
- Options Flow
- Entity Registry
- Device Registry
- History-aware services

---

## v1.0.0

First Stable Release

Goals

- Stable Architecture
- Complete Documentation
- Public Repository
- Production-ready Integration

# =============================================================================
# ENGINEERING BACKLOG
# =============================================================================

Legend

🟥 Current Sprint

Immediate development focus.

Work currently in progress.

🟧 Next Milestone

Planned immediately after the current sprint.

🟨 Planned

Already approved.

Implementation at a later stage.

🟩 Future Architecture

Long-term evolution.

No implementation planned yet.

---

# 🟥 CURRENT SPRINT

The following work packages are currently the highest project priority.

---

# SHCF Core

Status

In Progress

Priority

Highest

Goal

Continue stabilizing the reusable SHCF Core while keeping it independent from
individual use cases.

## Controller

### Completed

- Central controller
- Automatic mode
- Continuous operation
- Timed operation
- Adjustable timed operation
- Automatic return after timed operation
- Operating status sensor
- Recommendation sensor
- Dehumidification demand sensor

### Next Tasks

- Review controller logic
- Simplify controller automations
- Reduce duplicated template logic
- Improve error handling
- Improve unavailable-state handling
- Improve startup behavior
- Improve restart behavior

---

## Helpers

### Completed

- Operating mode
- Target mode
- Humidity profile
- Control characteristic
- Timer helpers

### Planned Improvements

- Helper consistency review
- Helper naming review
- Better grouping
- Translation preparation

---

## Templates

Continue modularization.

Split large template collections into dedicated files.

Target structure

templates/

- target_humidity.yaml
- hysteresis.yaml
- dewpoint.yaml
- operating_status.yaml
- recommendations.yaml
- diagnostics.yaml
- analytics.yaml

---

## Automations

Continue modularization.

Target structure

automations/

- controller.yaml
- timed_operation.yaml
- operating_mode.yaml
- notifications.yaml

---

## Dashboard

Current priorities

- improve consistency
- remove duplicated cards
- improve responsiveness
- improve mobile usability
- improve icon consistency
- improve terminology consistency

---

# SHCF Analysis

Status

Active Development

Priority

Highest

Goal

Create a reusable climate analysis framework independent from individual
buildings.

---

## Common Module

Responsibilities

- shared entities
- shared calculations
- shared helpers
- shared templates

Tasks

- identify duplicated logic
- move reusable calculations
- prepare shared services

---

## Analytics Module

Status

Started

Completed

- Weekly Runtime
- Weekly Energy
- Humidity Exposure
- Utility Meter integration

Current Tasks

- Monthly Runtime
- Monthly Energy
- Runtime efficiency
- Energy efficiency
- Dehumidification performance
- Climate trend statistics

Future Tasks

- seasonal statistics
- annual statistics
- comparison reports

---

## Diagnostics Module

Status

Early Development

Current Tasks

- improve diagnosis model
- improve humidity diagnosis
- improve dew point diagnosis
- improve building diagnosis

Future Tasks

- automatic cause detection
- confidence estimation
- diagnostic scoring
- sensor plausibility checks

---

## Recommendations Module

Status

Early Development

Current Tasks

- recommendation engine
- context awareness
- diagnosis-based recommendations
- experiment-aware recommendations

Future Tasks

- energy optimization
- weather awareness
- seasonal recommendations
- learning recommendations

---

## Experiment Module

Status

Active Development

Current Tasks

- stabilize lifecycle
- improve experiment metadata
- improve experiment timeline
- improve experiment workflow

High Priority

- Adopt Existing Experiment
- automatic history lookup
- Recorder integration
- timeline improvements

---

# Climate Laboratory

Status

Reference Implementation

Purpose

Validate SHCF Analysis under real-world conditions.

---

## Dashboard

Completed

- Overview
- Measurements
- Analytics
- Diagnostics
- Recommendations
- Experiment
- Weather

Current Tasks

- dashboard cleanup
- consistent card design
- improved navigation
- improved section layout
- improved mobile usability

---

## Investigation Workflow

Current Tasks

- improve workflow guidance
- improve experiment documentation
- improve action tracking
- improve observation workflow

---

## Experiment Timeline

Current Tasks

- improve readability
- improve event descriptions
- reduce duplicate events
- support future pause/resume

---

## Weekly Trends

Current Tasks

- validate statistics
- improve presentation
- extend historical comparison

---

## Validation

Current Tasks

- verify all calculations
- verify controller behavior
- verify experiment workflow
- verify dashboard consistency

---

# Documentation

Priority

Highest

Current Tasks

- maintain README
- maintain ROADMAP
- maintain CHANGELOG
- maintain TODO

Continue documenting every architectural decision before implementation.

# =============================================================================
# 🟧 NEXT MILESTONE
# =============================================================================

The following work packages are planned immediately after the current sprint.

They define the transition from today's Analysis Framework towards a reusable
SHCF platform.

---

# Experiment Lifecycle

Status

Architecture Defined

Implementation

Planned

Objective

Transform the current experiment implementation into a reusable experiment
management framework.

---

## Lifecycle

Current lifecycle

Draft

↓

Running

↓

Paused

↓

Running

↓

Completed

Future extensions may include

- Cancelled
- Archived
- Imported

---

## Adopt Existing Experiment

High Priority

Objective

Allow users to continue an already running real-world experiment without manual
reconstruction.

The user should only provide

- experiment name
- historical start date/time
- current experiment phase

Everything else should be derived automatically.

---

### Automatic History Lookup

Target Architecture

The framework shall automatically determine

- energy meter at experiment start
- runtime
- historical humidity
- historical temperature
- historical operating mode

using Home Assistant Recorder.

Manual entry of historical values shall not be required.

---

### Recorder Abstraction

Future architecture

SHCF should not directly depend on Recorder.

Instead,

provide a dedicated

History Service

which hides all Recorder-specific logic.

Future Integration

Recorder

↓

History Service

↓

Experiment Manager

↓

Dashboard

---

## Pause / Resume

Planned

Support

Pause

Resume

Continue

without creating a new experiment.

Track

- elapsed duration
- active duration
- paused duration
- accumulated energy
- accumulated runtime

Timeline shall document

- start
- pause
- resume
- finish

---

## Experiment Templates

Future

Provide reusable experiment templates.

Examples

Initial Dehumidification

Building Investigation

Condensation Analysis

Heating Experiment

Ventilation Experiment

Long-term Monitoring

Users should be able to customize templates.

---

# Building Climate Analysis

Status

Concept Phase

Priority

High

Purpose

Extend SHCF Analysis from climate monitoring towards building physics.

---

## Surface Temperatures

Planned

Support manual or automatic recording of

- floor temperature
- ceiling temperature
- wall temperatures
- window temperature
- pipe temperature
- drain temperature

Future

Wireless surface sensors.

---

## Condensation Analysis

Planned

Compare

Surface Temperature

with

Indoor Dew Point

Determine

- condensation risk
- safety margin
- affected surfaces

---

## Thermal Bridge Detection

Future

Compare

surface temperatures

between

- north wall
- south wall
- east wall
- west wall

Detect

possible thermal bridges.

---

## Moisture Source Localization

Future

Combine

- absolute humidity
- surface temperatures
- experiment observations
- weather
- ventilation state

Estimate

probable moisture source.

---

## Multi-Location Measurements

Extend the current laboratory.

Planned measurement locations

- former indoor pool
- fitness room
- heating room
- outdoor south-west
- outdoor north-east

Future

Unlimited measurement locations.

---

## Building Model

Long-term goal

Represent

rooms

connections

airflow

temperature

humidity

as one building model.

---

# SHCF Blueprint

Status

Planned

Objective

Provide a reusable Home Assistant Blueprint.

User inputs

- smart switch
- humidity sensor
- temperature sensor

Framework automatically creates

- helpers
- templates
- controller
- dashboard

Minimal manual configuration.

---

# Instance Provisioning

Objective

Generate complete SHCF instances.

Automatically create

- entities
- helpers
- timers
- automations
- dashboards

Future

Interactive instance generator.

---

# Appliance Evolution

Architecture

Current

Device

↓

Future

Climate Appliance

Reason

A controlled appliance consists of

- sensors
- actuators
- controller
- dashboard
- analytics

and therefore represents more than a single hardware device.

Migration will happen only after the architecture has matured.

---

# Dashboard Generation

Objective

Generate dashboards automatically.

Future

User selects

- appliance
- analysis modules
- dashboard style

Framework generates

complete dashboard.

---

# Deployment

Improve deployment workflow.

Current Tasks

- deployment validation
- backup verification
- synchronization improvements

Future

One-command deployment

Mac

↓

Repository

↓

Home Assistant

with automatic verification.

# =============================================================================
# 🟩 FUTURE ARCHITECTURE
# =============================================================================

The following topics are intentionally planned for the long-term evolution of
the framework.

They are not part of the current milestone but document the intended
architectural direction.

Implementation should only begin after the corresponding prerequisites have
been completed.

---

# SHCF Evolution

Long-term objective

Transform SHCF from a humidity controller into a modular building climate
management framework.

The transition should happen gradually while maintaining backward compatibility.

Possible future capabilities

- Humidity Control
- Heating Support
- Ventilation Support
- Cooling Support
- Air Quality Monitoring
- Air Filtration
- Weather Integration
- Building Climate Optimization

---

## SHCF → SHCCF

Status

Future Architecture

The project currently remains

Smart Humidity Control Framework

The transition to

Smart Home Climate Control Framework

should only occur once the framework supports climate-control capabilities
beyond humidity.

This migration is considered an architectural milestone rather than a version
number change.

---

# Climate Appliance

Future Architecture

Current terminology

Device

Future terminology

Climate Appliance

A Climate Appliance represents one complete climate-control unit consisting of

- sensors
- actuators
- controller
- analytics
- dashboard
- configuration
- diagnostics

Future appliance examples

- Dehumidifier
- Heating Controller
- Ventilation Controller
- Air Cleaner
- Combined Climate Controller

---

# Building Climate Analysis

Long-term Vision

The current Climate Laboratory shall evolve into a reusable Building Climate
Analysis Framework.

Potential analysis areas

- Condensation
- Mold Prevention
- Moisture Transport
- Thermal Bridges
- Air Exchange
- Ventilation Efficiency
- Building Envelope
- Energy Efficiency
- Drying Behaviour

Future analyses should combine

- indoor measurements
- outdoor measurements
- building observations
- experiments
- weather
- energy consumption

to generate engineering-quality diagnostics.

---

# Experiment Framework

Long-term Vision

Experiments should become reusable engineering objects.

Future functionality

- experiment templates
- experiment library
- experiment comparison
- automatic reports
- experiment export
- experiment import
- experiment sharing

---

# Artificial Intelligence

Future

Evaluate AI-assisted analysis.

Possible use cases

- anomaly detection
- diagnosis assistance
- recommendation generation
- experiment evaluation
- report generation

All AI-generated recommendations should remain explainable.

---

# Research Topics

The following research topics intentionally remain open.

Future work may investigate

- optimal humidity targets
- drying efficiency
- energy efficiency
- adaptive control
- predictive control
- weather forecasting
- occupancy influence
- seasonal behaviour
- long-term moisture transport

Research findings should continuously improve SHCF Core.

---

# Technical Debt

Current technical debt

- continue YAML modularization
- reduce duplicated logic
- improve naming consistency
- improve translations
- improve package separation
- improve dashboard modularization

Future technical debt

- migrate reusable logic into integration
- reduce template complexity
- reduce automation complexity
- remove legacy structures

Technical debt should continuously be reduced.

---

# Repository

Continue improving repository quality.

Tasks

- improve folder structure
- improve documentation
- improve examples
- improve deployment tools
- improve validation scripts
- improve developer onboarding

---

# Documentation

Continue maintaining

- README
- ROADMAP
- CHANGELOG
- TODO

Future documentation

- Architecture Decision Records (ADR)
- Developer Guide
- Integration Guide
- Blueprint Guide
- Dashboard Guide
- Analysis Guide
- Experiment Guide
- Building Climate Analysis Guide

Documentation should evolve together with the implementation.

---

# Success Criteria

The project should always strive for

- clear architecture
- modular design
- reusable components
- understandable code
- understandable documentation
- reproducible experiments
- validated engineering decisions

The objective is not merely to build a Home Assistant package.

The objective is to create a reusable open-source framework for climate control
and climate analysis.

# =============================================================================
# END OF ENGINEERING BACKLOG
# =============================================================================
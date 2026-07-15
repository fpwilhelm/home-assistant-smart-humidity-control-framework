# Engineering Backlog

> **Project:** Smart Humidity Control Framework (SHCF)  
> **Current Version:** v0.3.0 (Development)  
> **Current Milestone:** Analysis Framework  
> **Repository Status:** Private – Early Development

---

# Purpose

This document serves as the central engineering backlog for the **Smart Humidity Control Framework (SHCF)**.

Unlike a traditional TODO list, this document combines:

- current development priorities
- engineering tasks
- architectural direction
- technical debt
- research topics
- long-term framework evolution

The objective is to preserve a consistent architecture while enabling incremental development.

Long-term planning is intentionally separated from the daily development workflow.

---

# Engineering Principles

These principles guide every architectural and implementation decision.

## Architecture Before Implementation

New functionality should only be implemented after its architectural direction has been defined.

Avoid feature-driven development.

Prefer reusable concepts over one-off solutions.

---

## Incremental Development

Develop the framework in small, fully functional iterations.

Every milestone should produce a stable and testable system.

Avoid large disruptive changes whenever possible.

---

## Reusability

The SHCF Core should remain independent from individual use cases.

Use-case specific functionality belongs in examples, laboratories or future extensions—not in the reusable framework.

---

## Separation of Concerns

The framework consists of clearly separated modules.

| Module | Responsibility |
|---------|----------------|
| **SHCF Core** | Humidity control, helpers, controller, templates, automations |
| **SHCF Analysis** | Analytics, diagnostics, recommendations and experiments |
| **Climate Laboratory** | Reference implementation used to validate new concepts |

---

## Documentation First

Major architectural decisions should be documented before implementation.

| Document | Purpose |
|----------|---------|
| **README.md** | Introduces the project |
| **ROADMAP.md** | Describes future evolution |
| **CHANGELOG.md** | Documents completed work |
| **ENGINEERING_BACKLOG.md** | Defines future engineering work |
| **TODO.md** | Current sprint only |

---

## Backward Compatibility

Whenever practical, updates should preserve existing installations.

Breaking changes should be avoided.

If unavoidable, provide a migration strategy.

---

## Modular Design

Continue replacing large YAML files with small reusable modules.

Preferred structure:

```text
templates/
automations/
helpers/
dashboards/
examples/
tools/
docs/
```

---

## Engineering Quality

The project values:

- clarity over cleverness
- maintainability over brevity
- consistency over personal preference
- readability over complexity

---

# Current Development Status

| Item | Status |
|------|--------|
| **Project** | Smart Humidity Control Framework |
| **Version** | v0.3.0 (Development) |
| **Current Milestone** | Analysis Framework |
| **Repository** | Private |
| **Documentation** | Active restructuring |

## Current Focus

- Experiment Lifecycle
- Analytics
- Diagnostics
- Recommendations
- Climate Laboratory
- Building Climate Analysis

---

# Priority Levels

The engineering backlog uses four priority levels.

## 🟥 Current Sprint

Tasks currently under active development.

---

## 🟧 Next Milestone

Approved work that immediately follows the current sprint.

---

## 🟨 Planned

Future work that has been agreed but is intentionally postponed.

---

## 🟩 Future Architecture

Long-term architectural ideas.

These items are intentionally **not** scheduled for implementation yet.

---

# Architecture Decisions

The following decisions are currently considered established project direction.

## Project Identity

The project remains **Smart Humidity Control Framework (SHCF)**.

A future transition to **Smart Home Climate Control Framework (SHCCF)** will only occur once the framework supports climate-control capabilities beyond humidity control.

---

## Analysis Architecture

Analysis is part of SHCF.

It is **not** an independent project.

Current analysis modules include:

- Analytics
- Diagnostics
- Recommendations
- Experiment

---

## Climate Laboratory

The Climate Laboratory is the primary reference implementation.

Its purpose is to validate:

- algorithms
- diagnostics
- experiment workflows
- dashboard concepts
- user interaction

before functionality becomes part of the reusable framework.

---

## Device Evolution

Current concept

**Device**

↓

Future concept

**Climate Appliance**

This migration is planned only after the architecture has matured.

---

## Historical Data

Historical experiment data should be obtained automatically from the Home Assistant Recorder.

Manual entry of historical measurements is considered a temporary workaround only.

---

# Planned Releases

| Version | Focus |
|---------|-------|
| **v0.3.0** | Analysis Framework |
| **v0.4.0** | Instance Provisioning & Blueprint |
| **v0.5.0** | Multi-Instance Support |
| **v0.6.0** | Native Home Assistant Integration |
| **v1.0.0** | First Stable Release |

# 🟥 Current Sprint

The following work packages are the current development focus.

---

# SHCF Core

**Status:** 🟡 In Progress

**Priority:** 🟥 Current Sprint

## Objective

Continue stabilizing the reusable SHCF Core while maintaining strict separation
between framework functionality and use-case specific implementations.

---

## Controller

### Completed

- [x] Central humidity controller
- [x] Automatic mode
- [x] Continuous operation
- [x] Timed operation
- [x] Adjustable timed operation
- [x] Automatic return after timed operation
- [x] Operating status sensor
- [x] Recommendation sensor
- [x] Dehumidification demand sensor

### Current Tasks

- [ ] Simplify controller logic
- [ ] Reduce duplicated template logic
- [ ] Improve startup behaviour
- [ ] Improve restart behaviour
- [ ] Improve unavailable-state handling
- [ ] Improve controller diagnostics

---

## Helpers

### Completed

- [x] Operating Mode
- [x] Target Mode
- [x] Humidity Profiles
- [x] Control Characteristics
- [x] Timed Operation Helpers

### Current Tasks

- [ ] Review helper naming
- [ ] Improve helper consistency
- [ ] Prepare translation support
- [ ] Group helpers logically

---

## Templates

### Objective

Continue modularization of template sensors.

### Target Structure

```text
templates/
├── target_humidity.yaml
├── hysteresis.yaml
├── dew_point.yaml
├── operating_status.yaml
├── recommendations.yaml
├── diagnostics.yaml
└── analytics.yaml
```

### Current Tasks

- [ ] Split remaining large template files
- [ ] Remove duplicated calculations
- [ ] Improve template readability
- [ ] Standardize naming

---

## Automations

### Target Structure

```text
automations/
├── controller.yaml
├── timed_operation.yaml
├── operating_mode.yaml
└── notifications.yaml
```

### Current Tasks

- [ ] Continue automation modularization
- [ ] Reduce duplicated logic
- [ ] Improve maintainability
- [ ] Improve error handling

---

## Dashboard

### Current Tasks

- [ ] Improve layout consistency
- [ ] Improve mobile usability
- [ ] Standardize icons
- [ ] Standardize terminology
- [ ] Remove duplicate cards

---

# SHCF Analysis

**Status:** 🟡 Active Development

**Priority:** 🟥 Current Sprint

## Objective

Develop a reusable climate analysis framework independent of any specific building.

---

## Common Module

### Responsibilities

- Shared calculations
- Shared helpers
- Shared templates
- Shared services

### Current Tasks

- [ ] Identify duplicated logic
- [ ] Move reusable calculations
- [ ] Prepare common analysis services

---

## Analytics

### Completed

- [x] Weekly Runtime
- [x] Weekly Energy
- [x] Humidity Exposure
- [x] Utility Meter Integration

### Current Tasks

- [ ] Monthly Runtime
- [ ] Monthly Energy
- [ ] Runtime efficiency
- [ ] Energy efficiency
- [ ] Climate trend statistics

### Future Improvements

- [ ] Seasonal statistics
- [ ] Annual statistics
- [ ] Comparative reports

---

## Diagnostics

### Current Tasks

- [ ] Improve diagnosis model
- [ ] Improve humidity diagnostics
- [ ] Improve dew point diagnostics
- [ ] Improve building diagnostics

### Future Improvements

- [ ] Automatic cause detection
- [ ] Diagnostic confidence score
- [ ] Sensor plausibility checks
- [ ] Root cause ranking

---

## Recommendations

### Current Tasks

- [ ] Continue recommendation engine
- [ ] Context-aware recommendations
- [ ] Diagnosis-based recommendations
- [ ] Experiment-aware recommendations

### Future Improvements

- [ ] Weather-aware recommendations
- [ ] Energy-aware recommendations
- [ ] Adaptive recommendations

---

## Experiment Module

### Current Tasks

- [ ] Stabilize experiment lifecycle
- [ ] Improve experiment metadata
- [ ] Improve experiment workflow
- [ ] Improve experiment timeline

### High Priority

- [ ] Adopt Existing Experiment
- [ ] Automatic history lookup
- [ ] Recorder abstraction
- [ ] Timeline improvements

---

# Climate Laboratory

**Status:** 🟢 Reference Implementation

**Priority:** 🟥 Current Sprint

## Purpose

Validate SHCF Analysis using a real-world building.

---

## Dashboard

### Completed

- [x] Overview
- [x] Measurements
- [x] Analytics
- [x] Diagnostics
- [x] Recommendations
- [x] Experiment
- [x] Weather

### Current Tasks

- [ ] Improve navigation
- [ ] Improve dashboard consistency
- [ ] Improve section layout
- [ ] Improve mobile usability

---

## Investigation Workflow

### Current Tasks

- [ ] Improve workflow guidance
- [ ] Improve observation tracking
- [ ] Improve action documentation
- [ ] Improve experiment workflow

---

## Experiment Timeline

### Current Tasks

- [ ] Improve readability
- [ ] Improve event descriptions
- [ ] Reduce duplicate events
- [ ] Prepare pause/resume support

---

## Weekly Trends

### Current Tasks

- [ ] Validate calculations
- [ ] Improve presentation
- [ ] Extend historical comparison

---

## Validation

### Current Tasks

- [ ] Validate controller behaviour
- [ ] Validate dashboard calculations
- [ ] Validate experiment workflow
- [ ] Validate analysis results

---

# Documentation

**Priority:** 🟥 Current Sprint

### Current Tasks

- [ ] Maintain README.md
- [ ] Maintain ROADMAP.md
- [ ] Maintain CHANGELOG.md
- [ ] Maintain ENGINEERING_BACKLOG.md
- [ ] Maintain TODO.md

### Objective

Keep documentation synchronized with the implementation and document architectural decisions before introducing major new functionality.

# 🟧 Next Milestone

The following work packages define the next architectural milestone after the
current sprint.

The objective is to transform today's reference implementation into a reusable
framework suitable for multiple installations.

---

# Experiment Lifecycle

**Status:** 🟡 Architecture Defined

**Priority:** 🟧 Next Milestone

## Objective

Transform the current experiment implementation into a reusable experiment
management framework.

---

## Lifecycle

### Current Lifecycle

```text
Draft
   │
   ▼
Running
   │
   ▼
Paused
   │
   ▼
Running
   │
   ▼
Completed
```

### Future Lifecycle States

- [ ] Cancelled
- [ ] Archived
- [ ] Imported
- [ ] Read Only

---

## Adopt Existing Experiment

### Objective

Allow users to continue an already running real-world experiment.

The user should only provide:

- Experiment Name
- Historical Start Date & Time
- Current Experiment Phase

Everything else should be restored automatically.

---

## Automatic History Lookup

### Goal

Retrieve historical experiment data directly from Home Assistant.

Automatically determine:

- [ ] Energy meter at experiment start
- [ ] Runtime
- [ ] Temperature
- [ ] Relative humidity
- [ ] Operating mode
- [ ] Controller state

Manual entry of historical values should only be used as an emergency fallback.

---

## History Service

### Target Architecture

```text
Home Assistant Recorder
            │
            ▼
      History Service
            │
            ▼
   Experiment Manager
            │
            ▼
        Dashboard
```

### Responsibilities

- Read historical sensor values
- Determine experiment start values
- Provide a unified interface
- Hide Recorder-specific implementation details

---

## Pause / Resume

### Planned Features

- [ ] Pause experiment
- [ ] Resume experiment
- [ ] Continue without creating a new experiment
- [ ] Preserve timeline continuity

Track separately:

- Total Duration
- Active Duration
- Paused Duration
- Energy Consumption
- Runtime

Timeline should document:

- Start
- Pause
- Resume
- Finish

---

## Experiment Templates

Provide reusable templates for common investigations.

### Planned Templates

- [ ] Initial Dehumidification
- [ ] Building Investigation
- [ ] Condensation Analysis
- [ ] Heating Experiment
- [ ] Ventilation Experiment
- [ ] Long-Term Monitoring

Templates should remain fully customizable.

---

# Building Climate Analysis

**Status:** 🟡 Concept Phase

**Priority:** 🟧 Next Milestone

## Objective

Extend SHCF Analysis from climate monitoring towards building physics.

---

## Surface Temperatures

Support recording of:

- [ ] Floor temperature
- [ ] Ceiling temperature
- [ ] North wall
- [ ] South wall
- [ ] East wall
- [ ] West wall
- [ ] Windows
- [ ] Heating pipes
- [ ] Floor drain
- [ ] Ventilation ducts

Future versions should support wireless surface sensors.

---

## Condensation Analysis

Compare

- Surface Temperature

with

- Indoor Dew Point

Determine:

- [ ] Condensation Risk
- [ ] Safety Margin
- [ ] Critical Surfaces

---

## Thermal Bridge Detection

Compare temperatures between building surfaces.

Possible indicators:

- North vs. South wall
- Ceiling vs. Floor
- Interior vs. Exterior wall

Future:

- Automatic thermal bridge detection

---

## Moisture Source Localization

Combine:

- Absolute humidity
- Surface temperatures
- Experiment observations
- Outdoor climate
- Ventilation state
- Energy consumption

Estimate probable moisture sources.

---

## Measurement Locations

Current laboratory locations

- Former Indoor Pool
- Fitness Room
- Heating Room
- Outdoor South-West
- Outdoor North-East

Future

Unlimited measurement locations.

---

## Building Model

Long-term objective

Represent a complete building model consisting of:

- Rooms
- Connections
- Airflow
- Climate
- Measurements
- Experiments

---

# SHCF Blueprint

**Status:** 🟧 Planned

## Objective

Provide a reusable Home Assistant Blueprint.

User configuration should require only:

- Smart Switch
- Humidity Sensor
- Temperature Sensor

Everything else should be generated automatically.

---

## Automatic Generation

Create automatically:

- [ ] Helpers
- [ ] Template Sensors
- [ ] Timers
- [ ] Controller Automations
- [ ] Dashboard

Minimize manual configuration.

---

# Instance Provisioning

**Status:** 🟧 Planned

## Objective

Generate complete SHCF instances automatically.

Generate:

- [ ] Helpers
- [ ] Timers
- [ ] Template Sensors
- [ ] Automations
- [ ] Dashboards

Future:

Interactive instance generator.

---

# Climate Appliance Evolution

**Status:** 🟩 Future Architecture

Current terminology

**Device**

↓

Future terminology

**Climate Appliance**

A Climate Appliance consists of:

- Sensors
- Actuators
- Controller
- Dashboard
- Analytics
- Diagnostics
- Configuration

Migration should occur only after the architecture has matured.

---

# Dashboard Generation

**Status:** 🟧 Planned

## Objective

Generate dashboards automatically.

Future users should select:

- Appliance
- Analysis Modules
- Dashboard Style

The framework generates a complete dashboard automatically.

---

# Deployment

**Status:** 🟧 Planned

## Current Tasks

- [ ] Deployment validation
- [ ] Backup verification
- [ ] Synchronization improvements

## Long-Term Goal

Provide one-command deployment.

```text
Mac
 │
 ▼
Git Repository
 │
 ▼
Home Assistant
```

including automatic validation and rollback support.

# 🟩 Future Architecture

The following topics describe the long-term evolution of the Smart Humidity
Control Framework.

They are intentionally **not scheduled** for implementation yet and should only
be addressed once the current architecture has stabilized.

---

# SHCF Evolution

**Status:** 🔵 Vision

## Long-Term Objective

Evolve SHCF from a humidity controller into a modular building climate
management framework while maintaining backward compatibility.

Possible future capabilities include:

- [ ] Humidity Control
- [ ] Heating Support
- [ ] Cooling Support
- [ ] Ventilation Support
- [ ] Air Quality Monitoring
- [ ] Air Filtration
- [ ] Weather Integration
- [ ] Building Climate Optimization

---

# SHCF → SHCCF

**Status:** 🔵 Future Architecture

The project currently remains

**Smart Humidity Control Framework (SHCF)**.

A future transition to

**Smart Home Climate Control Framework (SHCCF)**

should only occur once the framework provides reusable climate-control
capabilities beyond humidity control.

This transition represents an architectural milestone rather than a marketing
decision.

---

# Climate Appliance

**Status:** 🔵 Future Architecture

Long-term terminology:

```text
Device
   │
   ▼
Climate Appliance
```

A Climate Appliance represents a complete climate-control unit consisting of:

- Sensors
- Actuators
- Controller
- Configuration
- Dashboard
- Analytics
- Diagnostics

Future appliance examples:

- [ ] Dehumidifier
- [ ] Heating Controller
- [ ] Ventilation Controller
- [ ] Air Cleaner
- [ ] Combined Climate Controller

---

# Building Climate Analysis Framework

**Status:** 🔵 Vision

The current Climate Laboratory should evolve into a reusable framework for
building climate investigations.

Potential analysis domains:

- [ ] Condensation
- [ ] Mold Prevention
- [ ] Moisture Transport
- [ ] Thermal Bridges
- [ ] Air Exchange
- [ ] Ventilation Efficiency
- [ ] Building Envelope
- [ ] Energy Efficiency
- [ ] Drying Behaviour

Future analyses should combine:

- Indoor Measurements
- Outdoor Measurements
- Surface Temperatures
- Weather Data
- Building Observations
- Experiment Results
- Energy Consumption

to generate engineering-grade diagnostics.

---

# Experiment Framework

**Status:** 🔵 Vision

Experiments should become reusable engineering objects.

Planned capabilities:

- [ ] Experiment Templates
- [ ] Experiment Library
- [ ] Experiment Comparison
- [ ] Automatic Reports
- [ ] Import / Export
- [ ] Shared Experiment Definitions

---

# Artificial Intelligence

**Status:** 🔵 Research

Evaluate AI-assisted climate analysis.

Potential use cases:

- [ ] Anomaly Detection
- [ ] Diagnostic Assistance
- [ ] Recommendation Generation
- [ ] Experiment Evaluation
- [ ] Automated Reports

AI-generated recommendations should always remain explainable.

---

# Research Topics

The following topics intentionally remain open.

Future investigation may include:

- [ ] Adaptive Humidity Targets
- [ ] Predictive Climate Control
- [ ] Weather Forecast Integration
- [ ] Seasonal Behaviour
- [ ] Occupancy Influence
- [ ] Moisture Transport
- [ ] Drying Efficiency
- [ ] Energy Optimisation

Research findings should continuously improve SHCF Core.

---

# Technical Debt

Technical debt should be reduced continuously.

## Architecture

- [ ] Continue YAML modularization
- [ ] Remove duplicated logic
- [ ] Improve package separation
- [ ] Simplify automation structure

## Naming

- [ ] Standardize terminology
- [ ] Review entity naming
- [ ] Review helper naming

## Dashboard

- [ ] Remove duplicate cards
- [ ] Standardize icons
- [ ] Improve responsiveness

## Integration

- [ ] Reduce template complexity
- [ ] Move reusable logic into the native integration
- [ ] Prepare Config Flow migration

---

# Documentation

Documentation should evolve together with the implementation.

Maintain continuously:

- [ ] README.md
- [ ] ROADMAP.md
- [ ] CHANGELOG.md
- [ ] ENGINEERING_BACKLOG.md
- [ ] TODO.md

Future documentation:

- [ ] Architecture Decision Records (ADR)
- [ ] Developer Guide
- [ ] Integration Guide
- [ ] Blueprint Guide
- [ ] Dashboard Guide
- [ ] Analysis Guide
- [ ] Experiment Guide
- [ ] Building Climate Analysis Guide

---

# Success Criteria

The framework should always strive for:

- Clear architecture
- Modular design
- Reusable components
- Understandable code
- High-quality documentation
- Reproducible experiments
- Explainable engineering decisions
- Long-term maintainability

---

# Engineering Vision

The objective is not merely to build another Home Assistant package.

The objective is to create an open, reusable engineering framework for
humidity control, climate analysis and, ultimately, comprehensive building
climate management.

Future development should always prioritise architectural quality over feature
quantity.

---
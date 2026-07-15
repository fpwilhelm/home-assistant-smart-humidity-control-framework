# SHCF Roadmap

This roadmap outlines the planned evolution of the **Smart Humidity Control Framework (SHCF)** and the **Smart Home Climate Control Framework (SHCCF)**.

The roadmap describes the major architectural milestones. Detailed implementation tasks are maintained separately in the project TODO list.

---

# Development Philosophy

The project is developed incrementally.

Each stage builds upon the previous one while maintaining a stable architecture, consistent terminology and a clear separation between reusable framework components and use-case specific functionality.

The long-term architecture consists of two complementary pillars:

- **SHCF** – Smart Humidity Control Framework
  - Humidity control
  - Device abstraction
  - Automation
  - Blueprint
  - Native Home Assistant integration

- **SHCCF Climate Laboratory**
  - Climate analysis
  - Diagnostics
  - Building investigation
  - Recommendations
  - Experiment management
  - Scientific evaluation

Both pillars share a common architecture and are developed in parallel.

---

# Long-Term Evolution

```text
Proof of Concept
        │
        ▼
Modular Framework
        │
        ▼
Analysis Framework
        │
        ▼
Reusable Automation Blueprint
        │
        ▼
Multi-Instance Support
        │
        ▼
Native Home Assistant Integration
        │
        ▼
First Stable Release
```

---

# Planned Releases

## v0.1.0 – Proof of Concept

Completed

First functional Home Assistant implementation demonstrating the SHCF control concept.

Main achievements:

- automatic humidity control
- humidity target control
- first dashboard
- first template sensors
- first automations

---

## v0.2.0 – Modular Development Platform

Completed

Main achievements:

- modular package architecture
- reusable framework structure
- SHCF Device Profiles
- repository structure
- documentation
- development workflow

---

## v0.3.0 – Analysis Framework

**Current development version**

Current focus:

- SHCCF Climate Laboratory
- modular Analysis Framework
- Analytics
- Diagnostics
- Recommendations
- Experiment module
- Experiment lifecycle
- Climate Laboratory dashboard
- building investigation workflow

---

## v0.4.0 – SHCF Instance Provisioning

Planned

Goals:

- reusable SHCF device provisioning
- portable device packages
- simplified installation
- standardized entity naming
- dashboard generation

---

## v0.5.0 – Multi-Instance Support

Planned

Goals:

- multiple independent SHCF devices
- multiple Climate Laboratory instances
- independent dashboards
- independent configuration
- multiple dehumidifiers

---

## v0.6.0 – Native Home Assistant Integration

Planned

Goals:

- Config Flow
- Options Flow
- Device Registry
- Entity Registry
- automatic entity creation
- history-aware services
- migration path from Blueprint to Integration

---

## v1.0.0 – First Stable Release

Planned

Goals:

- stable framework architecture
- production-ready Home Assistant integration
- stable Climate Laboratory
- complete documentation
- first public release
- long-term maintenance

---

# Future Development

After the first stable release, SHCF/SHCCF will expand beyond the current reference implementation.

Possible future areas include:

## Climate Control

- Multi-Device Control
- coordinated dehumidifiers
- ventilation systems
- adaptive control strategies
- weather-aware control
- energy optimization

## Climate Laboratory

- automated building diagnostics
- moisture source localization
- experiment templates
- experiment assistant
- historical experiment comparison
- climate trend analysis
- building physics evaluation
- mold prevention

These features are intentionally planned after the first stable architecture has been established.

---

# Versioning

The project follows Semantic Versioning.

Major architectural milestones are reflected by the project version.

Development versions are marked accordingly until the first stable release.

---

# Related Documents

- README.md
- CHANGELOG.md
- TODO.md
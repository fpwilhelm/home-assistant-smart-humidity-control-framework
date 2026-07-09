# SHCF Roadmap

This roadmap outlines the planned evolution of the **Smart Humidity Control Framework (SHCF)**.

The roadmap describes the major development milestones. Detailed implementation tasks are maintained separately in the project TODO list.

---

# Development Philosophy

SHCF is developed incrementally.

Each development stage builds upon the previous one while maintaining a stable architecture and a consistent control concept.

The project evolves through the following stages:

```text
Proof of Concept
        │
        ▼
Modular Framework
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
Stable SHCF Release
```

---

# Planned Releases

## v0.1.0 – Proof of Concept

Completed

The first functional implementation demonstrating the SHCF control concept.

Main achievements:

* automatic humidity control
* humidity target control
* dashboard
* first template sensors
* first automation

---

## v0.2.0 – Modular Development Platform

**Current development version**

Focus:

* modular package architecture
* reusable project structure
* framework foundation
* German and English documentation
* diagnostics and recommendation layers
* repository structure
* development workflow

---

## v0.3.0 – Reusable Automation Blueprint

Planned

Goals:

* first reusable SHCF Blueprint
* simplified installation
* reusable configuration
* standardized entity structure

---

## v0.4.0 – Multi-Instance Support

Planned

Goals:

* multiple independent SHCF instances
* multiple dashboards
* multiple dehumidifiers in different rooms
* independent configuration for each installation

Each SHCF instance represents one complete hardware unit and operates independently.

---

## v0.5.0 – Native Home Assistant Integration

Planned

Goals:

* Config Flow
* Options Flow
* Device Registry
* Entity Registry
* automatic entity creation
* migration path from Blueprint to Integration

---

## v1.0.0 – First Stable Release

Planned

Goals:

* stable framework architecture
* production-ready Home Assistant integration
* complete documentation
* long-term maintenance
* first public release

---

# Future Development

After the first stable release, SHCF is planned to expand beyond the current reference implementation.

Possible future areas include:

* Multi-Device Control
* ventilation systems
* multiple coordinated dehumidifiers
* adaptive control strategies
* weather-aware control
* building physics evaluation
* mold prevention
* energy optimization
* additional humidity control devices

These features are intentionally planned after the first stable architecture has been established.

---

# Versioning

SHCF follows Semantic Versioning.

Major architectural milestones are reflected by the project version.

Development versions are marked accordingly until the first stable release.

---

# Related Documents

* README.md
* CHANGELOG.md
* TODO.md

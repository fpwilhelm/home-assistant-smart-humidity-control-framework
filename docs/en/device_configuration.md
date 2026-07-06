# Device Configuration

## Purpose

This document describes the technical requirements for operating the Smart Humidity Control Framework.

It defines the required devices, sensors, and hardware components together with their expected capabilities.

The requirements described in this document are independent of any specific Home Assistant implementation.

---

# Architecture

In its current version, the framework consists of four primary components.

```text
Sensors
      │
      ▼
Controller
      │
      ▼
Switching Device
      │
      ▼
Dehumidifier
```

Each component may be implemented using hardware from different manufacturers.

---

# Required Components

The framework requires at least the following components.

- Dehumidifier
- Temperature and humidity sensor
- Switchable smart plug or relay

---

# Dehumidifier

## Requirements

The selected dehumidifier should

- automatically resume operation after power is restored
- support continuous operation
- be suitable for external power switching

These characteristics enable reliable automatic operation.

---

# Device Properties

In addition to the basic requirements, every dehumidifier has technical characteristics that may be used by the framework.

Some properties are essential for operation, while others improve comfort, diagnostics, and future optimizations.

---

## Required Properties

The following properties are required for reliable automatic operation.

| Property | Description |
|----------|-------------|
| Continuous Operation | The device must continue operating after being switched on. |
| Automatic Restart | The device must automatically resume operation after a power interruption. |
| Condensate Drain Configuration | Continuous drain or internal water tank. |

---

## Recommended Properties

These properties improve future calculations and user experience.

| Property | Unit | Purpose |
|----------|------|----------|
| Rated Power | W | Dashboard, power evaluation |
| Maximum Dehumidification Capacity | l / 24 h | Tank level estimation, efficiency evaluation |
| Water Tank Capacity | l | Tank level estimation |

---

## Optional Properties

Additional device characteristics may be supported in future versions.

| Property | Purpose |
|----------|----------|
| Air Flow Rate | Optimization |
| Operating Temperature Range | Plausibility checks |
| Automatic Defrost | Documentation |
| Noise Level | Documentation |

All optional properties may be used by the framework but are not required for basic operation.

---

# Condensate Drain Configuration

A dehumidifier may operate using different condensate handling methods.

## Continuous Drain

Condensate is permanently discharged through a drain hose.

This is the recommended configuration for unattended continuous operation.

---

## Water Tank Operation

Condensate is collected inside the internal water tank.

The tank must be emptied regularly.

Future versions of the framework will estimate the tank fill level and notify the user before the tank is expected to become full.

The estimation may consider factors such as

- dehumidifier runtime
- relative humidity
- room temperature
- dehumidification demand
- power consumption
- water tank capacity
- maximum dehumidification capacity

The estimation becomes more accurate as additional device properties are available.

The calculated fill level is always an approximation.

Future versions may additionally use historical operating data to continuously improve the estimation.

---

## Water Tank with Level Sensor

Optionally, a tank level sensor may be installed.

When available, the measured tank level takes precedence over any calculated estimation.

---

## Configuration

The condensate drain configuration is stored as a device property.

Supported configurations are

- Continuous Drain
- Water Tank
- Water Tank with Level Sensor

---

# Temperature and Humidity Sensor

## Requirements

The sensor should provide at least

- temperature
- relative humidity

These measurements form the foundation of the entire control system.

---

## Placement

The sensor should be positioned where it best represents the actual room climate.

The following influences should be avoided whenever possible.

- direct sunlight
- radiators
- direct airflow from the dehumidifier
- windows with frequent air exchange

---

# Switching Device

## Requirements

The switching device must

- safely switch the dehumidifier
- be rated for the required electrical load

---

## Recommended Properties

The following capabilities are recommended.

- Power Measurement
- Energy Consumption Measurement

These values are used for dashboard visualization and future optimizations.

---

# Optional Components

Future versions of the framework may support additional sensors and devices.

Examples include

- Water Tank Level Sensor
- Outdoor Temperature Sensor
- Outdoor Humidity Sensor
- Second Indoor Humidity Sensor
- Window Contacts
- Ventilation System
- Fan

These components are optional and not required for normal operation.

---

# Reference Implementation

The current reference implementation uses the following configuration.

| Property | Reference |
|----------|-----------|
| Dehumidifier | Trotec TTK 171 ECO |
| Continuous Operation | Yes |
| Automatic Restart | Yes |
| Condensate Drain Configuration | Continuous Drain |
| Rated Power | 900 W |
| Maximum Dehumidification Capacity | 52 l / 24 h |
| Water Tank Capacity | 6 l |
| Sensor | Temperature and Humidity Sensor |
| Switching Device | Smart Plug with Power and Energy Measurement |

This configuration serves solely as the reference implementation.

The framework itself is completely independent of specific manufacturers or products.

---

# Design Principles

## Manufacturer Independent

All components may be replaced by equivalent devices.

---

## Modular

Each component has a clearly defined responsibility.

---

## Extensible

Additional sensors or devices can be integrated without changing the controller architecture.

---

## Fault Tolerant

Optional sensors must never affect the basic functionality of the framework.

The framework must remain fully operational even when optional components are unavailable.

---

# Future

Planned extensions include

- multiple dehumidifiers
- integration with ventilation systems
- integration with fans
- dew point sensors
- tank level sensors
- automatic tank level estimation
- self-learning tank level estimation
- automatic device recommendations based on known models
- window control
- energy-optimized device strategies

---

# Summary

The Smart Humidity Control Framework requires only a small number of mandatory components.

The clear separation between sensors, controller, switching device, and dehumidifier keeps the framework manufacturer independent while allowing future expansion with additional humidity reduction strategies.

Support for different condensate drain configurations and standardized device properties already provides the foundation for future features such as tank level estimation, self-learning calculations, and optional tank level sensors.
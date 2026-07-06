# Glossary

This glossary defines the terminology used throughout the **Smart Humidity Control Framework**.

It serves as the authoritative terminology reference for the entire project documentation, the Home Assistant reference implementation, the Automation Blueprint, and the future native Home Assistant integration.

All project documentation shall use the terminology defined in this glossary consistently.

---

# Using this Glossary

Each entry contains the following information:

- **German term**
- **English term**
- **Description**
- **Usage notes** (where applicable)

The English terminology defined here also serves as the basis for the future implementation of the Blueprint, the native integration, and the source code.

---

# Architecture

## Framework

**German**

Framework

**Description**

The Smart Humidity Control Framework comprises the complete architecture for intelligent humidity control.

It consists of the documentation, the reference implementation, the Automation Blueprint, and the future native Home Assistant integration.

---

## Reference Implementation

**German**

Referenzimplementierung

**Description**

The current Home Assistant implementation of the framework.

It serves as the basis for development, testing, and documentation.

---

## Reference Device

**German**

Referenzgerät

**Description**

The device used to develop the reference implementation.

Current reference device:

- Trotec TTK 171 ECO

The framework itself remains manufacturer-independent.

---

# Control

## Target Humidity

**German**

Ziel-Luftfeuchtigkeit

**Description**

The desired relative humidity maintained by the controller.

**Note**

Within the framework, the term "humidity" always refers to **relative humidity**, unless explicitly stated otherwise.

---

## Relative Humidity

**German**

Relative Luftfeuchtigkeit

**Description**

The percentage of water vapor currently present in the air relative to the maximum amount the air can hold at the same temperature.

Unit:

```text
%
```

---

## Absolute Humidity

**German**

Absolute Luftfeuchtigkeit

**Description**

The actual amount of water vapor contained in the air.

It is currently not used directly by the framework but may become part of future advanced control strategies.

Unit:

```text
g/m³
```

---

## Humidity Profile

**German**

Feuchteprofil

**Description**

A humidity profile defines the recommended target humidity for a typical room or application.

Examples:

- Living Room
- Bedroom
- Bathroom
- Laundry Room
- Unheated Basement

---

## Control Characteristic

**German**

Regelcharakteristik

**Description**

The control characteristic defines how tightly or generously the controller regulates around the target humidity.

It primarily influences the applied hysteresis.

Current control characteristics:

- Strict
- Standard
- Flexible

---

## Target Mode

**German**

Zielwertmodus

**Description**

Defines how the target humidity is determined.

Current target modes:

- Humidity Profile
- Custom

---

## Hysteresis

**German**

Hysterese

**Description**

The difference between the target humidity and the activation threshold.

It prevents excessive switching of the controlled device.

---

## Activation Threshold

**German**

Einschaltgrenze

**Description**

Humidity level at which the controller activates the dehumidifier during automatic operation.

---

## Target Range

**German**

Zielbereich

**Description**

The range between the target humidity and the activation threshold.

The target range is visualized on the dashboard.

---

# Operating Modes

## Operating Mode

**German**

Betriebsmodus

**Description**

Defines the overall operating mode of the controller.

Current operating modes:

- Off
- Automatic
- Continuous Operation
- Timed Operation

---

## Operating Status

**German**

Betriebsstatus

**Description**

The logical state calculated by the controller.

The operating status is intended for display and diagnostic purposes only.

---

# Devices

## Dehumidifier

**German**

Luftentfeuchter

**Description**

The reference device of the framework.

Future versions may support additional humidity reduction strategies.

---

## Switching Device

**German**

Schaltgerät

**Description**

The device used by the framework to switch equipment on or off.

Examples:

- Smart Plug
- Relay
- Shelly
- Contactor

---

## Device Configuration

**German**

Gerätekonfiguration

**Description**

Configuration describing the characteristics of a supported device.

Examples:

- Rated Power
- Dehumidification Capacity
- Tank Capacity
- Condensate Drain Mode

---

# Sensors

## Template Sensor

**German**

Template-Sensor

**Description**

A calculated sensor within the reference implementation.

Template sensors contain calculated values only and provide the data basis for the controller and dashboard.

---

## Helper

**German**

Helfer

**Description**

User-configurable Home Assistant entities.

Helpers contain configuration only and no control logic.

---

# Building Physics

## Dew Point

**German**

Taupunkt

**Description**

The temperature at which water vapor begins to condense.

The dew point forms the basis for future building physics evaluations.

---

## Mold Risk

**German**

Schimmelrisiko

**Description**

Assessment of mold growth risk based on various environmental conditions.

This feature is planned for future framework versions.

---

# Development Stages

## Automation Blueprint

**German**

Automation Blueprint

**Description**

Reusable Home Assistant automation implementing the framework.

---

## Native Home Assistant Integration

**German**

Native Home Assistant Integration

**Description**

Future native implementation of the Smart Humidity Control Framework.

---

# Preferred Terminology

The following terminology shall be used consistently throughout the project.

| German | English |
|----------|-----------|
| Ziel-Luftfeuchtigkeit | Target Humidity |
| Relative Luftfeuchtigkeit | Relative Humidity |
| Feuchteprofil | Humidity Profile |
| Regelcharakteristik | Control Characteristic |
| Betriebsmodus | Operating Mode |
| Betriebsstatus | Operating Status |
| Hysterese | Hysteresis |
| Einschaltgrenze | Activation Threshold |
| Zielbereich | Target Range |
| Luftentfeuchter | Dehumidifier |
| Schaltgerät | Switching Device |
| Gerätekonfiguration | Device Configuration |
| Template-Sensor | Template Sensor |
| Helfer | Helper |

---

# Principle

This glossary is the authoritative terminology reference for the Smart Humidity Control Framework.

New terms shall be introduced here first and then used consistently throughout the entire project.
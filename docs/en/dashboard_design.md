# Dashboard Design

## Purpose

This document describes the user interface of the reference implementation of the Smart Humidity Control Framework.

The dashboard allows users to monitor and control the framework while presenting all relevant information about the current room climate and the dehumidifier.

The current dashboard serves as the reference implementation for the first blueprint. Future versions may extend its functionality without changing its fundamental structure.

---

# Design Goals

The dashboard pursues the following objectives.

- Clear presentation
- Simple operation
- Important information visible at a glance
- Clear separation between information, actions, and warnings
- Extensibility for future features

---

# Dashboard Areas

The dashboard is organized into five logical sections.

```text
Status

↓

Control

↓

Room Climate

↓

Power & Energy

↓

Diagnostics
```

This structure remains independent of the actual Home Assistant layout or card implementation.

---

# Status

The status section displays the current operating state of the framework.

## Information

- Operating Mode
- Operating Status
- Timed Operation Active
- Remaining Timed Operation Duration

The user should always be able to understand why the dehumidifier is currently running or stopped.

---

# Control

The control section contains all user-configurable settings.

## Actions

- Select Operating Mode
- Select Humidity Profile
- Select Control Characteristic
- Select Target Mode
- Configure Custom Target Humidity
- Start Timed Operation

The layout should support intuitive and efficient operation.

---

# Room Climate

This section visualizes the current room climate.

## Information

- Current Relative Humidity
- Target Humidity
- Target Range
- Room Temperature

## Planned Extensions

- Dew Point
- Target Dew Point
- Absolute Humidity
- Room Climate Assessment

---

# Power & Energy

This section displays the current operating data of the dehumidifier.

## Information

- Current Power Consumption
- Energy Consumption
- Device Status

## Planned Extensions

- Estimated Water Tank Level
- Measured Water Tank Level
- Dehumidification Performance
- Runtime Statistics

---

# Diagnostics

The diagnostics section supports monitoring and troubleshooting.

## Information

- Sensor Status
- Controller Status

## Warnings

Warnings indicate situations that require user attention.

Examples

- Empty Water Tank Soon
- Water Tank Full
- Sensor Failure
- Dehumidifier Unavailable
- Temperature Outside Recommended Operating Range

Warnings should be clearly visible and encourage appropriate user action.

---

# Information Groups

The dashboard intentionally distinguishes between three categories.

## Information

Displays the current system state.

Examples

- Current Relative Humidity
- Target Humidity
- Power Consumption
- Energy Consumption
- Operating Status

---

## Actions

Allow the user to change the system configuration.

Examples

- Change Operating Mode
- Change Humidity Profile
- Change Control Characteristic
- Start Timed Operation

---

## Warnings

Indicate conditions requiring user intervention.

Warnings may be generated from calculated values or from dedicated sensors.

---

# Reference Implementation

The current Home Assistant dashboard represents the reference implementation of the framework.

It is based on the entities provided by the reference implementation.

The first blueprint is intended to follow the same operating concept.

A future native Home Assistant integration may provide additional information and convenience features while preserving the overall user experience.

---

# Design Principles

## Information-Oriented

The dashboard specifies information groups rather than individual Home Assistant cards.

---

## Consistent

All displayed values are based on data calculated by the framework.

---

## Extensible

New information can be added without changing the existing structure.

---

## User-Friendly

Important information should always be visible without additional navigation.

Advanced functionality may be added without making the basic operation more complex.

---

# Future

Planned future enhancements include

- Water Tank Level Display
- Water Tank Level Estimation
- Water Tank Warnings
- Dew Point Visualization
- Absolute Humidity
- Mold Risk Assessment
- Ventilation Recommendations
- Energy Analysis
- Long-Term Statistics
- Support for Multiple Dehumidifiers

---

# Summary

The dashboard is the central user interface of the Smart Humidity Control Framework.

It presents all relevant information in a clear and structured way, provides intuitive control, and supports the user through warnings as well as future diagnostic and analytical features.

The current dashboard serves as the reference implementation for the first blueprint and will continue to evolve together with the framework.
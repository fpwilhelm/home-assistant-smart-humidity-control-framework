# Humidity Profiles

## Purpose

This document describes the humidity profile system of the Smart Humidity Control Framework.

Humidity profiles define recommended **relative humidity** target values for common room types and usage scenarios.

They provide the domain knowledge of the framework and form the foundation for calculating the target humidity automatically.

---

# Objectives

The humidity profile system pursues the following goals.

- Simple configuration
- Transparent target values
- Proven default recommendations
- Flexible customization
- Support for user-defined profiles
- Clear separation between room climate and control strategy

---

# Basic Principle

A humidity profile describes the desired long-term condition of the room climate.

It defines a recommended base value for the **relative humidity**.

The actual control behavior is then determined by the selected control characteristic.

```text
Humidity Profile
        │
        ▼
Base Value
        │
        ▼
Control Characteristic
        │
        ▼
Control Behavior
```

---

# Default Profiles

The reference implementation includes the following default profiles.

Each humidity profile defines

- a recommended base value for the relative humidity, and
- a recommended control characteristic.

The control characteristic is provided as a recommendation and can always be changed by the user.

| Humidity Profile | Base Value | Recommended Control Characteristic |
|------------------|-----------:|------------------------------------|
| Living Space | 50 % | Standard |
| Bedroom | 50 % | Flexible |
| Bathroom | 55 % | Standard |
| Internal Bathroom | 50 % | Strict |
| Workspace | 50 % | Standard |
| Technical Room | 50 % | Strict |
| Storage Room | 50 % | Standard |
| Heated Basement | 55 % | Standard |
| Unheated Basement | 60 % | Strict |
| Garage | 60 % | Flexible |
| Utility Room | 55 % | Strict |

The listed values represent recommended defaults and may be refined in future versions.

---

# Description of the Default Profiles

## Living Space

For living rooms, dining rooms, and hobby rooms with permanent occupancy.

---

## Bedroom

Optimized for sleeping environments with permanent occupancy.

---

## Bathroom

For regularly ventilated bathrooms with windows.

---

## Internal Bathroom

For bathrooms without windows or with limited natural ventilation.

---

## Workspace

For offices, home offices, workshops, and hobby rooms.

---

## Technical Room

For rooms containing technical building equipment.

---

## Storage Room

For archives, storage areas, and utility storage.

---

## Heated Basement

For heated basement rooms with regular use.

---

## Unheated Basement

For unheated basement rooms with increased moisture exposure.

---

## Garage

For garages and comparable unheated utility spaces.

---

## Utility Room

For rooms containing washing machines, dryers, laundry racks, or similar household activities.

---

# Control Characteristic

The control characteristic defines how precisely the controller maintains the target relative humidity.

It primarily influences the hysteresis used by the controller.

The control characteristic is independent of the selected humidity profile.

Each default profile includes a recommended control characteristic.

This recommendation is automatically selected when a humidity profile is chosen.

Users may change the control characteristic independently of the selected profile at any time.

## Strict

**Code**

```text
strict
```

A narrow control range with a small hysteresis.

Suitable for sensitive applications or rooms requiring a stable humidity level.

---

## Standard

**Code**

```text
standard
```

Balanced control behavior suitable for most applications.

This is the recommended default setting.

---

## Flexible

**Code**

```text
flexible
```

A wider hysteresis resulting in fewer switching cycles.

Suitable for rooms with less demanding humidity requirements.

---

# User-defined Profiles

In addition to the default profiles, future versions will allow users to create their own humidity profiles.

A custom profile contains at least

- Profile Name
- Base Value
- Recommended Control Characteristic
- Description (optional)

This allows the framework to adapt to individual requirements.

---

# Target Humidity

The target humidity is determined by the selected humidity profile.

The control characteristic then influences the control behavior, especially the applied hysteresis.

```text
Humidity Profile
        │
        ▼
Target Humidity

Control Characteristic
        │
        ▼
Control Behavior
```

Alternatively, users may specify a fixed target humidity.

In that case, the humidity profile is not used.

---

# Selecting a Humidity Profile

A humidity profile represents the intended use of a room.

The actual room name is not important.

Instead, the desired room climate determines the appropriate profile.

Examples

- An archive uses the **Storage Room** profile.
- A hobby room uses the **Living Space** profile.
- A basement office uses the **Workspace** profile.

---

# Scope

Humidity profiles describe only the desired long-term room climate.

They explicitly do not define

- Operating Modes
- Control Characteristics
- Special Programs

---

# Special Programs

Temporary special-purpose scenarios are not part of the humidity profile system.

Examples include

- Water Damage Drying
- Drying Program
- New Construction Drying
- Screed Drying
- Building Drying

These applications will be implemented as independent special programs in future versions.

---

# Design Principles

## Usage Instead of Room Name

Humidity profiles describe the intended use of a room rather than its name.

---

## Device Independent

Humidity profiles are completely independent of the dehumidifier model used.

---

## Reusable

The same profiles can be used by both the Home Assistant blueprint and the future native integration.

---

## Extensible

New default profiles can be added at any time.

User-defined profiles remain unaffected.

---

## Separation of Responsibilities

Humidity profiles define the desired room climate.

The control characteristic defines how that climate is maintained.

The controller decides when to switch the dehumidifier.

---

# Future

Planned extensions include

- freely configurable profiles
- profile import and export
- adaptive profiles
- self-learning target values
- regional recommendations
- automatic profile suggestions

---

# Summary

Humidity profiles form the domain foundation of the Smart Humidity Control Framework.

They define the desired long-term **relative humidity** of a room and, together with the control characteristic, provide the basis for transparent, flexible, and maintainable room climate control.
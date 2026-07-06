# Helper Entities

## Purpose

This document describes all Home Assistant helper entities used by the current reference implementation of the Smart Humidity Control Framework.

Helper entities provide only the user-configurable parameters of the framework.

They contain no control logic. All calculations are performed by the template sensors, while all control decisions are made exclusively by the controller.

---

# Reference Implementation

The entity IDs used throughout this document originate from the current reference implementation based on the **Trotec TTK 171 ECO**.

They are provided as examples only.

In future blueprint versions, these helpers will be replaced by blueprint inputs.

In the native Home Assistant integration, they will be replaced entirely by internal configuration objects.

---

# Overview

The helper entities are divided into four logical groups.

- Operating Modes
- Control Parameters
- Device Parameters
- Time Control

---

# Operating Modes

## Operating Mode

**Current Reference Implementation**

```text
input_select.trotec_ttk_171_eco_betriebsmodus
```

**Type**

`input_select`

**Options**

- Off
- Automatic
- Continuous Operation
- Timed Operation

**Description**

Defines the controller's active operating mode.

---

## Target Mode

**Current Reference Implementation**

```text
input_select.trotec_ttk_171_eco_zielwertmodus
```

**Type**

`input_select`

**Options**

- Humidity Profile
- User Defined

**Description**

Determines how the target relative humidity is calculated.

---

# Control Parameters

## Humidity Profile

**Current Reference Implementation**

```text
input_select.trotec_ttk_171_eco_raumtypauswahl
```

> This entity ID will be renamed to `...humidity_profile` in a future version.

**Type**

`input_select`

**Default Profiles**

- Living Room
- Bedroom
- Bathroom
- Office
- Music Room
- Kitchen
- Storage Room
- Utility Room
- Heated Basement
- Unheated Basement
- Laundry Drying Room
- Laundry Room
- Indoor Pool
- Garage
- Desert (Test Profile)

**Description**

A humidity profile defines the recommended base humidity for a typical application.

Future versions will allow users to create, edit, and remove custom humidity profiles.

---

## Protection Level

**Current Reference Implementation**

```text
input_select.trotec_ttk_171_eco_schutzniveau
```

**Type**

`input_select`

**Options**

- Comfort
- Standard
- Conservative

**Description**

The protection level adjusts the base humidity defined by the selected humidity profile.

It may also influence the applied hysteresis.

---

## User-defined Target Humidity

**Current Reference Implementation**

```text
input_number.trotec_ttk_171_eco_eigener_zielwert
```

**Type**

`input_number`

**Unit**

%

**Description**

Used whenever the target mode is set to **User Defined**.

---

# Device Parameters

## Rated Power

**Current Reference Implementation**

```text
input_number.trotec_ttk_171_eco_nennleistung
```

**Type**

`input_number`

**Unit**

W

**Description**

Rated power of the configured dehumidifier.

This value is used for dashboard visualization and future efficiency analysis.

---

## Gauge Maximum

**Current Reference Implementation**

```text
input_number.trotec_ttk_171_eco_gauge_maximum_leistung
```

**Type**

`input_number`

**Unit**

W

**Description**

Defines the maximum value of the power gauge.

This allows dashboards to be adapted to different dehumidifier models.

---

# Time Control

## Timed Operation

**Current Reference Implementation**

```text
timer.trotec_ttk_171_eco_zeitbetrieb
```

**Type**

`timer`

**Description**

Maintains the remaining runtime of an active timed operation.

---

## Timed Operation Duration

**Current Reference Implementation**

```text
input_number.trotec_ttk_171_eco_zeitbetrieb_dauer
```

**Type**

`input_number`

**Unit**

Minutes

**Description**

Defines the default duration of a timed operation.

---

## Behavior When Target Is Reached

**Current Reference Implementation**

```text
input_select.trotec_ttk_171_eco_zeitbetrieb_verhalten_bei_zielerreichung
```

**Type**

`input_select`

**Options**

- Turn Off
- Return to Automatic Mode

**Description**

Defines how the controller behaves when the target humidity is reached during an active timed operation.

---

# Architectural Note

Helper entities provide only user input and configuration parameters.

They intentionally contain no control logic.

```text
User
      │
      ▼
Helper Entities
      │
      ▼
Template Sensors
      │
      ▼
Controller
      │
      ▼
Devices
```

This separation provides a clean architecture and simplifies both the blueprint implementation and the future native Home Assistant integration.

---

# Future

The current reference implementation relies on Home Assistant helper entities.

Future blueprint versions and the native Home Assistant integration will automatically provide and manage the required configuration.

As a result, manual creation of most helper entities will no longer be necessary while preserving the same underlying configuration model.
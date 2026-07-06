# Template Sensors

## Purpose

This document describes all template sensors used by the current reference implementation of the Smart Humidity Control Framework.

The template sensors form the calculation layer of the reference implementation. They provide all computed values required by the controller, dashboards, and future blueprint or native integration implementations.

The framework regulates **humidity** as its target variable. The controlled object is the **room climate**. In the current reference implementation, the **dehumidifier** is the controlled reference device.

---

# Reference Implementation

The entity IDs used throughout this document originate from the current reference implementation based on the **Trotec TTK 171 ECO**.

They are provided as examples only and will later be replaced by generic inputs in the blueprint or internal entities within the native Home Assistant integration.

---

# Target Values

## Target Humidity

**Entity**

```text
sensor.trotec_ttk_171_eco_ziel_luftfeuchtigkeit
```

**Purpose**

Calculates the current target relative humidity.

**Dependencies**

- Target Mode
- Humidity Profile
- Protection Level
- User-defined Target Humidity

**Logic**

If the target mode is **User Defined**, the configured user-defined target humidity is used.

Otherwise, the target humidity is calculated as

```text
Humidity Profile Base Value + Protection Level Adjustment
```

**Used by**

- Controller
- Dashboard
- Target Range
- Switch-on Threshold
- Target Deviation
- Target Dew Point

---

## Hysteresis

**Entity**

```text
sensor.trotec_ttk_171_eco_hysterese
```

**Purpose**

Defines the distance between the target humidity and the switch-on threshold.

**Dependencies**

- Protection Level

**Current Values**

| Protection Level | Hysteresis |
|-----------------|-----------:|
| Comfort | 3 % |
| Standard | 5 % |
| Conservative | 7 % |

**Used by**

- Switch-on Threshold
- Controller

---

## Switch-on Threshold

**Entity**

```text
sensor.trotec_ttk_171_eco_einschaltgrenze
```

**Purpose**

Defines the humidity value at which the controller starts the dehumidifier in Automatic mode.

**Formula**

```text
Switch-on Threshold = Target Humidity + Hysteresis
```

**Used by**

- Controller
- Dashboard
- Operating Status
- Target Range Upper Limit

---

# Target Range

The target range is currently used for dashboard visualization only.

It represents the range between the target humidity and the switch-on threshold and currently has no direct influence on the control algorithm.

## Target Range Lower Limit

**Entity**

```text
sensor.trotec_ttk_171_eco_zielbereich_untergrenze
```

**Purpose**

Defines the lower limit of the displayed target range.

**Logic**

```text
Target Range Lower Limit = Target Humidity
```

**Used by**

- Dashboard
- Gauge Card Pro

---

## Target Range Upper Limit

**Entity**

```text
sensor.trotec_ttk_171_eco_zielbereich_obergrenze
```

**Purpose**

Defines the upper limit of the displayed target range.

**Logic**

```text
Target Range Upper Limit = Switch-on Threshold
```

**Used by**

- Dashboard
- Gauge Card Pro

---

# Dew Point

The dew point values extend the evaluation of the room climate.

They are not required for the current humidity control algorithm but provide the foundation for future building physics analysis.

## Indoor Dew Point

**Entity**

```text
sensor.trotec_ttk_171_eco_taupunkt_innen
```

**Status**

Optional / Planned

**Purpose**

Calculates the current indoor dew point from temperature and relative humidity.

**Dependencies**

- Indoor Temperature
- Indoor Relative Humidity

**Used by**

- Dashboard
- Building physics evaluation
- Condensation analysis
- Mold risk assessment

---

## Target Dew Point

**Entity**

```text
sensor.trotec_ttk_171_eco_ziel_taupunkt
```

**Status**

Optional / Planned

**Purpose**

Calculates the dew point corresponding to the current room temperature and target humidity.

**Dependencies**

- Indoor Temperature
- Target Humidity

**Difference**

- **Indoor Dew Point** represents the current state.
- **Target Dew Point** represents the desired state.

**Used by**

- Building physics evaluation
- Comparison between current and desired humidity conditions

---

# Evaluation

## Target Deviation

**Entity**

```text
sensor.trotec_ttk_171_eco_sollwertabweichung
```

**Purpose**

Calculates the difference between the current humidity and the target humidity.

**Formula**

```text
Target Deviation = Current Humidity − Target Humidity
```

**Interpretation**

| Value | Meaning |
|------:|---------|
| less than 0 | drier than target |
| 0 | target reached |
| greater than 0 | more humid than target |

**Used by**

- Dashboard
- Charts
- Statistics

---

## Dehumidification Demand

**Entity**

```text
sensor.trotec_ttk_171_eco_entfeuchtungsbedarf
```

**Purpose**

Evaluates the target deviation as an easily understandable status.

**Dependencies**

- Current Humidity
- Target Humidity

**Current Classification**

| Deviation | Status |
|----------:|--------|
| ≤ 0 % | None |
| > 0 to 2 % | Low |
| > 2 to 5 % | Medium |
| > 5 to 10 % | High |
| > 10 % | Very High |

**Used by**

- Dashboard
- Future automations
- Future optimization

**Note**

The dehumidification demand is currently intended for evaluation and visualization only.

It is not used directly by the controller for switching decisions.

---

# Operating Status

## Operating Status

**Entity**

```text
sensor.trotec_ttk_171_eco_betriebsstatus
```

**Purpose**

Calculates the controller's current logical operating state.

**Possible States**

- Off
- Continuous Operation
- Timed Operation Active
- Timed Operation Finished
- Automatic – Dehumidifying
- Automatic – Minimum Runtime
- Automatic – Target Reached
- Automatic – Waiting
- Sensor Error
- Unknown State

**Used by**

- Controller
- Dashboard
- Diagnostics

---

## Operating Status Display

**Entity**

```text
sensor.trotec_ttk_171_eco_betriebsstatus_anzeige
```

**Purpose**

Generates a user-friendly representation of the operating status.

**Examples**

```text
💧 Automatic – Dehumidifying
✅ Automatic – Target Reached
⏱️ Timed Operation Active
⏻ Off
```

**Used by**

- Dashboard
- User Interface

**Note**

This entity is intended for display purposes only.

The controller exclusively uses the logical operating status.

---

# Architectural Note

The template sensors form the calculation layer between configuration, physical sensors, and the controller.

```text
User
      │
      ▼
Helper Entities
      │
      ▼
Physical Sensors
      │
      ▼
Template Sensors
      │
      ▼
Controller
      │
      ▼
Dehumidifier
```

This separation ensures that all calculations are performed centrally while the controller is responsible only for decision-making.

---

# Design Principles

## Centralized Calculation

Each calculated value is generated exactly once and then shared by all components.

## Reusability

Template sensors can be used simultaneously by the controller, dashboards, and future automations.

## Transparency

All calculations remain transparent and can be verified independently of the controller.

## Separation of Calculation and Control

Template sensors calculate values.

The controller makes decisions.

The dehumidifier executes the resulting control action.

---

# Future

The current reference implementation uses Home Assistant template sensors.

In a future native integration, the same logical values may be calculated internally and exposed as standard sensor entities.

Future extensions may introduce additional humidity reduction strategies without changing the underlying calculation layer.

---

# Summary

The template sensors form the calculation layer of the current reference implementation of the Smart Humidity Control Framework.

They provide all calculated values centrally and clearly separate calculations from control logic, user interface, and device control.
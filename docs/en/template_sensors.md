# Template Sensors

## Purpose

This document describes all template sensors used by the current reference implementation of the **Smart Humidity Control Framework**.

The template sensors form the calculation layer of the reference implementation. They provide all computed framework values required by the controller, dashboards, and future blueprint or native integration implementations.

The framework regulates **relative humidity** as its target variable. The controlled object is the **room climate**. In the current reference implementation, the **dehumidifier** is the controlled reference device.

---

# Reference Implementation

The entity IDs used throughout this document originate from the current reference implementation based on the **Trotec TTK 171 ECO**.

They are provided as examples only and will later be replaced by generic inputs in the Automation Blueprint or internal entities within the native Home Assistant integration.

---

# Sensor Groups

The template sensors of the reference implementation can be divided into four functional groups.

## Target Values

Calculated target values used by the humidity control algorithm.

- Target Humidity
- Target Range Lower Limit
- Target Range Upper Limit

## Control

Calculated values supporting the control algorithm.

- Hysteresis
- Switch-on Threshold
- Target Deviation
- Dehumidification Demand

## Controller

Logical states provided by the controller.

- Operating Status
- Operating Status Display

## Diagnostics

Calculated or derived diagnostic values.

- Indoor Dew Point
- Target Dew Point

Additional diagnostic sensors may be introduced in future framework versions.

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
- Control Characteristic
- User-defined Target Humidity

**Logic**

If the target mode is **User Defined**, the configured user-defined target humidity is used.

Otherwise, the target humidity is calculated as

```text
Humidity Profile Base Value + Control Characteristic Adjustment
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

Hysteresis is one of the central calculated framework values and is determined exclusively by the selected control characteristic.

**Dependencies**

- Control Characteristic

**Current Values**

| Control Characteristic | Hysteresis |
|------------------------|-----------:|
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

Target deviation is one of the most important calculated framework values. It describes the current difference between the actual and desired humidity and serves both as a diagnostic value and as the foundation for future control strategies and optimization.

**Formula**

```text
Target Deviation = Current Humidity − Target Humidity
```

**Interpretation**

| Value | Meaning |
|------:|---------|
| less than 0 | Drier than target humidity |
| 0 | Target humidity reached |
| greater than 0 | More humid than target humidity |

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
- Future optimizations

**Note**

The dehumidification demand is currently intended for evaluation and visualization only.

It does not influence any controller decision.

---

# Operating Status

## Operating Status

**Entity**

```text
sensor.trotec_ttk_171_eco_betriebsstatus
```

**Purpose**

Calculates the current logical operating state of the controller.

The operating status describes only the controller's logical decision.

It does not represent either the actual state of the switching device or the physical operating state of the dehumidifier.

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
Switching Device
      │
      ▼
Dehumidifier
```

This separation ensures that all calculations are performed centrally while the controller is responsible exclusively for decision-making.

---

# Design Principles

## Centralized Calculation

Each calculated value is generated exactly once and is subsequently reused by all components.

This prevents multiple implementations of the same logical calculation.

---

## Reusability

Template sensors can be used simultaneously by the controller, dashboards, and future automations.

This keeps the reference implementation modular and easy to extend.

---

## Transparency

All calculations remain transparent and can be verified independently of the controller.

This simplifies both troubleshooting and future framework development.

---

## Separation of Calculation and Control

Template sensors calculate values.

The controller makes decisions.

The switching device executes the controller's decision.

The dehumidifier subsequently changes the room climate.

This strict separation of responsibilities is one of the fundamental architectural principles of the Smart Humidity Control Framework.

---

# Future

The current reference implementation uses Home Assistant template sensors.

In a future native Home Assistant integration, the same logical framework values may be calculated internally and exposed directly as sensor entities.

This preserves the framework's conceptual model while allowing the technical implementation to evolve.

---

# Planned Template Sensors

Future versions of the framework may provide additional calculated values.

Examples include:

- Estimated Tank Fill Level
- Tank Full Warning
- Dew Point Difference
- Condensation Risk
- Mold Risk
- Energy Efficiency Rating
- Dehumidification Performance
- Maintenance Status

These sensors are not part of the current reference implementation but are already considered in the long-term framework architecture.

---

# Summary

The template sensors form the calculation layer of the current reference implementation of the Smart Humidity Control Framework.

They provide all calculated framework values centrally and clearly separate calculations from control logic, user interface, and device control.

This architecture provides a transparent, understandable, and reusable control model while establishing the foundation for both the Automation Blueprint and the future native Home Assistant integration.
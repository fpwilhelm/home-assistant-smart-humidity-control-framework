# Device Configuration

This document describes the device configuration used by the **Smart Humidity Control Framework**.

The device configuration defines the technical characteristics of a supported device and provides the foundation for optimal control, diagnostics, and future framework extensions.

The device configuration is completely independent of manufacturers and specific Home Assistant entities.

---

# Objective

The device configuration has the following objectives:

- Describe the technical characteristics of a device
- Adapt the controller to different device types
- Support future diagnostic functions
- Prepare the framework for different dehumidifiers and future humidity reduction strategies

---

# Basic Principle

The Smart Humidity Control Framework intentionally separates

- Framework
- Controller
- Device Configuration
- Reference Device

This allows the same control algorithm to operate with different devices.

---

# Reference Device

The current reference implementation is based on the following device:

- **Trotec TTK 171 ECO**

The framework itself is manufacturer independent.

Additional dehumidifiers can be supported through an appropriate device configuration without modifying the control algorithm.

---

# Device Properties

Each supported device is described by a defined set of technical properties.

| Property | Required | Purpose |
|----------|:--------:|---------|
| Rated Power | ✔ | Power monitoring |
| Dehumidification Capacity | ✔ | Estimated tank fill calculation |
| Tank Capacity | Optional | Tank fill estimation |
| Tank / Continuous Drain Mode | ✔ | Control strategy and warnings |
| Automatic Restart | ✔ | Suitable for operation via a switching device |
| Supported Operating Modes | Optional | Device description |

Additional properties may be added in future framework versions.

---

# Tank Operation and Continuous Drain

The framework distinguishes between two different operating methods of a dehumidifier.

## Tank Operation

Condensate is collected in the integrated water tank.

Future versions of the framework may estimate the current tank filling level based on

- dehumidification capacity
- tank capacity
- operating time
- measured humidity

The user is notified before the tank is expected to become full.

---

## Continuous Drain

Condensate is continuously removed through a drain hose.

In this operating mode, no tank fill estimation is required.

---

# Tank Fill Level

Future versions of the framework support two different approaches.

## Estimated Tank Fill Level

Estimated using

- operating time
- dehumidification capacity
- tank capacity
- current humidity

This approach requires no additional hardware.

---

## Measured Tank Fill Level

Alternatively, a dedicated tank level sensor may be used.

In this case, the framework uses the measured value instead of an estimated fill level.

---

# Operation via a Switching Device

The framework controls the dehumidifier through a switching device.

For reliable operation, the dehumidifier should automatically restore its previous operating state after power has been restored.

This allows reliable operation using smart plugs, relays, contactors, or similar switching devices.

---

# Extensibility

The device configuration has intentionally been designed to remain open for future extensions.

Future framework versions may include additional properties such as

- airflow
- fan speeds
- noise level
- energy efficiency class
- integrated humidistat
- automatic defrost
- maintenance intervals
- filter condition

without requiring changes to the control algorithm.

---

# Summary

The device configuration describes all relevant technical characteristics of a supported device.

It enables manufacturer-independent control while providing the foundation for future diagnostics, maintenance functions, and optimization features.

By consistently separating the framework, controller, and device configuration, the overall architecture remains flexible, scalable, and future-proof.
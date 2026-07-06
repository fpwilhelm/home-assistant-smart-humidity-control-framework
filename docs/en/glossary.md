# Glossary

This glossary defines the terminology used throughout the **Home Assistant Smart Humidity Control Framework**.

The definitions provided here are authoritative for the documentation, the Automation Blueprint, the future native Home Assistant Integration and the user interface.

---

# Framework

The **Home Assistant Smart Humidity Control Framework** is a modular architecture for intelligent humidity control.

The framework consists of four independent architectural layers:

- Hardware
- Configuration
- Controller
- Visualization

The framework is manufacturer-independent and is designed to operate with any suitable actuator.

---

# Actuator

An actuator is a device controlled by the controller.

It executes the control decisions determined by the framework.

The framework currently focuses on:

- Dehumidifiers

Future versions may support additional actuator types, for example:

- Ventilation systems
- Window actuators
- Fans

The framework is designed to remain independent of the specific actuator type.

---

# Humidity Profile

A humidity profile describes a typical humidity control scenario.

Its primary purpose is to define the recommended base relative humidity for a particular use case.

Examples of standard profiles include:

- Living Room
- Bedroom
- Bathroom
- Unheated Basement
- Garage
- Technical Room

Future versions will allow users to create, modify and delete custom humidity profiles.

The controller operates exclusively on the properties of a humidity profile and never on room names or their labels.

---

# Protection Level

The protection level modifies the base humidity defined by a humidity profile.

The current protection levels are:

- Comfort
- Standard
- Conservative

Additional protection levels may be introduced in future versions.

---

# Target Mode

The target mode determines how the currently active target humidity is calculated.

Currently supported modes are:

- Humidity Profile
- Custom

Future target modes may include:

- Dew Point Control
- Outdoor Climate Control
- Optimization Mode

---

# Target Humidity

The target humidity is the humidity value currently used by the controller.

It is determined by the selected target mode.

---

# Hysteresis

Hysteresis prevents the actuator from switching on and off too frequently.

It defines the distance between the switch-off point and the switch-on point.

---

# Switch-on Threshold

The switch-on threshold defines the humidity level at which the controller activates the actuator.

It is calculated from:

- current target humidity
- hysteresis

---

# Operating Mode

The operating mode defines the fundamental operating behavior of the controller.

Currently supported operating modes are:

- Off
- Automatic
- Continuous
- Timed

Additional operating modes may be introduced in future versions.

---

# Controller

The controller represents the central control logic of the framework.

It processes:

- sensor values
- calculated values provided by template sensors
- target values
- operating modes
- configuration parameters

Based on this information, the controller decides how the connected actuators should operate.

The controller has no knowledge of specific rooms, devices or manufacturers.

---

# Control Algorithm

The control algorithm defines the functional rules governing humidity control.

It specifies the desired behavior independently of any implementation.

The same control algorithm is implemented by the reference implementation, the Automation Blueprint and the future native Home Assistant Integration.

---

# Reference Implementation

The reference implementation is the current Home Assistant implementation of the controller.

It serves as the foundation for both the Automation Blueprint and the future native Home Assistant Integration.

---

# Automation Blueprint

The Automation Blueprint provides a reusable Home Assistant implementation of the controller.

It enables the same control logic to be applied to different sensors, actuators and installations without modifying the source code.

---

# Native Home Assistant Integration

The native Home Assistant Integration is the long-term goal of the project.

It implements the same control algorithm as the reference implementation and the Automation Blueprint while automatically creating all required entities and significantly simplifying configuration.

---

# Device Configuration

Device configuration describes the properties of an actuator.

Examples include:

- Rated power
- Maximum power consumption
- Water tank capacity
- Continuous drain support
- Dehumidification capacity

These parameters describe only the actuator itself.

---

# Installation Configuration

Installation configuration describes the hardware available within a specific installation.

Examples include:

- Temperature sensor
- Humidity sensor
- Smart plug
- Outdoor sensors
- Wall temperature sensors

Installation parameters determine which information is available to the framework.

---

# Operating Status

The operating status describes the current state of the controller or the controlled system.

Examples include:

- Off
- Automatic – Waiting
- Automatic – Dehumidifying
- Automatic – Target Reached
- Continuous
- Timed Mode Active

The operating status is determined by the controller and is intended solely for visualization and evaluation.
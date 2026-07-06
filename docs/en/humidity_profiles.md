# Humidity Profiles

This document describes the humidity profiles used by the **Smart Humidity Control Framework**.

Humidity profiles define recommended target humidity values for typical room types and application scenarios. They form the basis of automatic humidity control and provide a simple, transparent, and consistent configuration of the controller.

Humidity profiles are completely independent of the underlying hardware and can be used by the reference implementation, the Automation Blueprint, and the future native Home Assistant integration.

---

# Objective

The objective of humidity profiles is to

- provide predefined configurations for common use cases,
- recommend appropriate target humidity values,
- enable consistent humidity control across different room types,
- relieve users from detailed knowledge of building physics.

A humidity profile defines only the desired target humidity.

It does **not** define how tightly or loosely the controller maintains this humidity. That behavior is determined by the **Control Characteristic**.

---

# Basic Principle

Each humidity profile defines at least the following properties:

- Profile name
- Description
- Recommended target humidity
- Recommended control characteristic

The recommended control characteristic serves as the default recommendation and may be changed by the user at any time.

Humidity profiles and control characteristics therefore remain independent concepts while working together as the foundation of the automatic control strategy.

---

# Standard Profiles

The framework provides the following standard profiles.

| Humidity Profile | Target Humidity | Recommended Control Characteristic | Description |
|------------------|----------------:|------------------------------------|-------------|
| Living Room | 55 % | Standard | Heated living areas with typical daily use |
| Bedroom | 50 % | Standard | Sleeping areas requiring slightly lower humidity |
| Bathroom | 60 % | Flexible | Rooms with regularly high humidity peaks |
| Laundry Room | 60 % | Flexible | Rooms used primarily for washing clothes |
| Drying Room | 50 % | Strict | Rooms primarily used for drying laundry |
| Workspace | 50 % | Standard | Offices, hobby rooms, and workspaces |
| Technical Room | 50 % | Standard | Utility rooms, heating rooms, and equipment rooms |
| Heated Basement | 55 % | Standard | Heated basement rooms |
| Unheated Basement | 55 % | Flexible | Unheated basements with seasonal humidity variations |
| Garage | 60 % | Flexible | Garages and similar utility areas |

---

# Description of the Standard Profiles

## Living Room

Recommended for typical heated living areas.

Examples include

- Living Room
- Dining Room
- Guest Room

Recommended Target Humidity:

**55 %**

Recommended Control Characteristic:

**Standard**

---

## Bedroom

Recommended for sleeping areas.

A slightly lower humidity level is often perceived as more comfortable and helps reduce the risk of condensation.

Recommended Target Humidity:

**50 %**

Recommended Control Characteristic:

**Standard**

---

## Bathroom

Recommended for bathrooms and shower rooms.

Regular humidity peaks make a more flexible control characteristic appropriate.

Recommended Target Humidity:

**60 %**

Recommended Control Characteristic:

**Flexible**

---

## Laundry Room

Recommended for rooms where clothes are washed.

Short-term humidity increases are normal and are taken into account by using a more flexible control characteristic.

Recommended Target Humidity:

**60 %**

Recommended Control Characteristic:

**Flexible**

---

## Drying Room

Recommended for rooms primarily used for drying laundry.

This profile intentionally maintains a lower humidity level and uses a stricter control characteristic to support the drying process.

Recommended Target Humidity:

**50 %**

Recommended Control Characteristic:

**Strict**

---

## Workspace

Recommended for offices, hobby rooms, and general workspaces.

This profile provides a balanced indoor climate suitable for extended occupancy and electronic equipment.

Recommended Target Humidity:

**50 %**

Recommended Control Characteristic:

**Standard**

---

## Technical Room

Recommended for heating rooms, utility rooms, and other technical areas.

This profile helps protect technical equipment from continuously elevated humidity.

Recommended Target Humidity:

**50 %**

Recommended Control Characteristic:

**Standard**

---

## Heated Basement

Recommended for heated basement rooms.

Since these rooms are often used similarly to living spaces, a balanced control strategy is appropriate.

Recommended Target Humidity:

**55 %**

Recommended Control Characteristic:

**Standard**

---

## Unheated Basement

Recommended for unheated basements.

These rooms frequently experience seasonal humidity fluctuations. A more flexible control characteristic helps avoid unnecessary switching.

Recommended Target Humidity:

**55 %**

Recommended Control Characteristic:

**Flexible**

---

## Garage

Recommended for garages and similar utility spaces.

Humidity may temporarily increase due to vehicles or weather conditions. This profile takes these typical fluctuations into account.

Recommended Target Humidity:

**60 %**

Recommended Control Characteristic:

**Flexible**

---

# Custom Humidity Profiles

In addition to the standard profiles, users can create their own humidity profiles.

A custom humidity profile consists of at least

- Profile name
- Target humidity
- Recommended control characteristic
- Optional description

This allows individual requirements and special room types to be represented easily.

The recommended control characteristic serves only as a default recommendation and can always be changed independently of the humidity profile.

---

# Relationship Between Humidity Profile and Control Characteristic

Humidity profiles and control characteristics are two independent concepts.

The humidity profile answers the question:

> **Which target humidity should be maintained?**

The control characteristic answers the question:

> **How tightly or loosely should that target humidity be maintained?**

Separating these concepts provides significantly greater flexibility.

For example, an unheated basement may use either the **Standard** or **Flexible** control characteristic while keeping exactly the same humidity profile.

For every standard profile, the framework recommends an appropriate control characteristic.

Users are always free to accept or modify this recommendation.

---

# Extensibility

Humidity profiles are intentionally independent of specific hardware and sensors.

Future versions of the framework may therefore extend them with additional properties such as

- adaptive target humidity
- seasonal adjustments
- learning humidity profiles
- location-specific recommendations
- building physics evaluation
- dew point control

without changing the underlying framework architecture.

---

# Special Programs

Certain applications differ fundamentally from normal room humidity control.

Therefore, they are **not** implemented as standard humidity profiles.

Examples include

- building drying after water damage
- construction drying
- restoration projects

These applications usually require maximum or sustained dehumidification for a limited period, together with additional warnings regarding energy consumption, material stress, and condensate handling.

They are therefore planned as future special operating programs.

---

# Summary

Humidity profiles form the foundation of automatic humidity control.

They define the recommended target humidity for typical rooms and application scenarios.

The actual control behavior is determined independently by the selected control characteristic.

This separation provides a flexible, transparent, and future-proof architecture for the Smart Humidity Control Framework.
# Dokumentationsindex

Willkommen in der Dokumentation des **Smart Humidity Control Framework**.

Dieses Dokument dient als zentraler Einstiegspunkt in die Projektdokumentation und beschreibt die Struktur des Frameworks sowie die empfohlene Lesereihenfolge.

---

# Dokumentationsstruktur

Die Dokumentation gliedert sich in fünf Bereiche.

```text
Smart Humidity Control Framework

│

├── Einstieg

├── Architektur

├── Framework

├── Home Assistant

└── Entwicklung
```

---

# Einstieg

Diese Dokumente vermitteln einen schnellen Überblick über das Projekt.

| Dokument | Beschreibung |
|----------|--------------|
| README.md | Projektübersicht, Ziele und Funktionen |

---

# Architektur

Diese Dokumente beschreiben die fachliche Architektur des Frameworks.

| Dokument | Beschreibung |
|----------|--------------|
| architecture.md | Gesamtarchitektur des Frameworks |
| glossary.md | Einheitliche Begriffsdefinitionen |
| integration_design.md | Architektur der zukünftigen Home-Assistant-Integration |

---

# Framework

Diese Dokumente beschreiben die eigentliche Regelungslogik.

| Dokument | Beschreibung |
|----------|--------------|
| control_algorithm.md | Fachlicher Regelalgorithmus |
| controller_reference.md | Aufgaben und Verantwortlichkeiten des Controllers |
| humidity_profiles.md | Standardisierte Feuchteprofile |
| device_configuration.md | Anforderungen und Eigenschaften unterstützter Geräte |

---

# Home Assistant

Diese Dokumente beschreiben die aktuelle Referenzimplementierung.

| Dokument | Beschreibung |
|----------|--------------|
| helper_entities.md | Benutzerkonfiguration über Home-Assistant-Helfer |
| template_sensors.md | Berechnete Sensoren des Frameworks |
| dashboard_design.md | Benutzeroberfläche der Referenzimplementierung |
| automation_blueprint.md | Home-Assistant-Blueprint des Frameworks |
| installation_guide.md | Installation und Migration |

---

# Entwicklung

Diese Dokumente richten sich hauptsächlich an Entwickler.

| Dokument | Beschreibung |
|----------|--------------|
| coding_guidelines.md | Entwicklungsrichtlinien und Projektstandards |

---

# Projektarchitektur

Die Dokumentation folgt derselben Architektur wie das Framework.

```text
Gerätekonfiguration

        │

        ▼

Feuchteprofile

        │

        ▼

Template-Sensoren

        │

        ▼

Controller

        │

        ▼

Dashboard

        │

        ▼

Blueprint

        │

        ▼

Native Home Assistant Integration
```

Jede Ebene besitzt eine klar definierte Aufgabe und baut auf den darunterliegenden Komponenten auf.

---

# Empfohlene Lesereihenfolge

## Für Anwender

1. README
2. Installation Guide
3. Dashboard Design
4. Humidity Profiles

Diese Dokumente reichen aus, um das Framework zu installieren und zu verwenden.

---

## Für Entwickler

1. README
2. Architecture
3. Glossary
4. Integration Design
5. Control Algorithm
6. Controller Reference
7. Device Configuration
8. Humidity Profiles
9. Template Sensors
10. Helper Entities
11. Dashboard Design
12. Automation Blueprint
13. Coding Guidelines

Diese Reihenfolge vermittelt zunächst die fachlichen Grundlagen und anschließend die technische Umsetzung.

---

# Entwicklungsstand

Die Dokumentation beschreibt drei Entwicklungsstufen des Projekts.

## Referenzimplementierung

Die aktuelle Home-Assistant-Implementierung dient als Grundlage für Entwicklung, Tests und Dokumentation.

---

## Automation Blueprint

Der Blueprint stellt die erste installierbare Version des Frameworks bereit.

Er basiert vollständig auf der Referenzimplementierung.

---

## Native Home Assistant Integration

Langfristig soll das Framework als eigenständige Home-Assistant-Integration bereitgestellt werden.

Die Integration übernimmt die vollständige Einrichtung und Verwaltung des Frameworks.

---

# Dokumentationsprinzipien

Die gesamte Dokumentation folgt gemeinsamen Grundsätzen.

- Klare Trennung zwischen Fachlogik und Implementierung
- Einheitliche Terminologie
- Herstellerunabhängigkeit
- Modularität
- Erweiterbarkeit
- Deutsche und englische Dokumentation bleiben funktional identisch

---

# Zusammenfassung

Die Dokumentation des Smart Humidity Control Framework beschreibt die fachlichen Grundlagen, die Referenzimplementierung sowie die zukünftige Weiterentwicklung des Projekts.

Dieses Dokument dient als zentraler Einstiegspunkt und unterstützt Anwender und Entwickler dabei, die passende Dokumentation schnell zu finden.
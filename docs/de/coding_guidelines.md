# Entwicklungsrichtlinien

## Zweck

Dieses Dokument definiert die Entwicklungsrichtlinien des Smart Humidity Control Framework.

Es beschreibt die gemeinsamen Grundsätze für Architektur, Implementierung, Dokumentation und Weiterentwicklung des Projekts.

Die Richtlinien gewährleisten eine konsistente, wartbare und langfristig erweiterbare Entwicklung aller Bestandteile des Frameworks.

---

# Grundprinzipien

Alle Entwicklungen innerhalb des Projekts folgen den gleichen Grundsätzen.

- Einfachheit vor Komplexität
- Lesbarkeit vor Optimierung
- Konsistenz vor individuellen Vorlieben
- Modularität vor Redundanz
- Framework vor Implementierung
- Fachlogik vor Herstellerlogik

Jede Änderung sollte die langfristige Qualität des Frameworks verbessern.

---

# Architektur

Das Framework besteht aus klar voneinander getrennten Komponenten.

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

Native Integration
```

Jede Komponente besitzt genau eine klar definierte Aufgabe.

---

# Verantwortlichkeiten

## Gerätekonfiguration

Beschreibt ausschließlich die Eigenschaften der verwendeten Geräte.

Sie enthält keine Regelungslogik.

---

## Feuchteprofile

Beschreiben ausschließlich das gewünschte Raumklima.

Sie enthalten keine gerätespezifischen Informationen.

---

## Template-Sensoren

Führen sämtliche Berechnungen durch.

Template-Sensoren berechnen Werte.

Sie treffen keine Entscheidungen.

---

## Controller

Der Controller bewertet ausschließlich bereits berechnete Werte.

Er entscheidet lediglich über notwendige Aktionen.

Eigene Berechnungen innerhalb des Controllers sind zu vermeiden.

---

## Dashboard

Das Dashboard visualisiert Informationen.

Es enthält keine Regelungslogik.

---

# Verantwortlichkeitstrennung

Jede Komponente besitzt genau eine Aufgabe.

| Komponente | Aufgabe |
|------------|---------|
| Gerätekonfiguration | Geräteeigenschaften |
| Helfer | Benutzereinstellungen |
| Template-Sensoren | Berechnungen |
| Controller | Entscheidungen |
| Dashboard | Visualisierung |

Verantwortlichkeiten sollen sich niemals überschneiden.

---

# Benennung

Eine einheitliche Terminologie ist wesentlicher Bestandteil des Frameworks.

## Dokumentation

In der Dokumentation werden verständliche Fachbegriffe verwendet.

Beispiele

- Relative Luftfeuchtigkeit
- Ziel-Luftfeuchtigkeit
- Feuchteprofil
- Regelcharakteristik

---

## Code

Im Quellcode werden kurze, eindeutige Bezeichner verwendet.

Beispiele

```text
target_humidity
relative_humidity
humidity_profile
control_characteristic
device_configuration
```

Abkürzungen sollten vermieden werden, sofern sie nicht allgemein etabliert sind.

---

## Entity-IDs

Entity-IDs sollen

- eindeutig
- stabil
- möglichst herstellerunabhängig

sein.

Gerätespezifische Entity-IDs sind ausschließlich Bestandteil der Referenzimplementierung.

Blueprint und Integration verwenden generische Konfigurationen.

---

# Dokumentation

Dokumentation ist Bestandteil des Quellcodes.

Jede wesentliche Architekturentscheidung soll dokumentiert werden.

Beispiele in der Dokumentation sollen stets mit der tatsächlichen Implementierung übereinstimmen.

---

# Kommentare

Kommentare erklären

- warum eine Lösung gewählt wurde,

nicht

- was der Code macht.

Gut strukturierter Code sollte seine Funktion möglichst selbst erklären.

---

# Home Assistant

Das Framework orientiert sich an den Best Practices von Home Assistant.

Hierzu gehören unter anderem

- Blueprint-Konventionen
- Integrationsarchitektur
- Entity-Benennung
- Konfigurationsfluss
- Übersetzungssystem

---

# Internationalisierung

Das Framework wird zweisprachig entwickelt.

## Deutsch

Deutsch dient als primäre Sprache der Projektdokumentation.

---

## Englisch

Die englische Dokumentation wird parallel gepflegt.

Beide Sprachversionen sollen funktional identisch bleiben.

Keine Sprachversion darf veralten.

---

# Erweiterbarkeit

Neue Funktionen sollen bestehende Konzepte erweitern.

Parallele oder konkurrierende Lösungen sollen vermieden werden.

Beispiele

- neue Feuchteprofile
- neue Regelstrategien
- zusätzliche Sensoren
- weitere Gerätetypen

ohne die bestehende Architektur grundlegend zu verändern.

---

# Herstellerunabhängigkeit

Das Framework beschreibt allgemeine Konzepte.

Bevorzugte Begriffe

```text
Luftentfeuchter
Schaltkomponente
Temperatursensor
Feuchtesensor
```

Herstellernamen wie

```text
Trotec
Shelly
Ecowitt
```

gehören ausschließlich zur Referenzimplementierung.

---

# Referenzimplementierung

Die Referenzimplementierung demonstriert die Architektur des Frameworks.

Sie dient als Grundlage für

- Dokumentation
- Blueprint
- spätere native Integration

Alle Implementierungen sollen sich funktional identisch verhalten.

---

# Versionsverwaltung

Die Entwicklung folgt einem sauberen Git-Workflow.

Empfohlen werden

- kleine Commits
- aussagekräftige Commit-Nachrichten
- getrennte Features und Bugfixes
- Code-Reviews vor dem Zusammenführen

---

# Qualität

Jede Änderung sollte mindestens einen der folgenden Aspekte verbessern.

- Lesbarkeit
- Wartbarkeit
- Modularität
- Benutzerfreundlichkeit
- Dokumentation

Änderungen, die lediglich die Komplexität erhöhen, sollen vermieden werden.

---

# Zukunft

Diese Richtlinien werden gemeinsam mit dem Framework weiterentwickelt.

Geplante Ergänzungen umfassen unter anderem

- Python-spezifische Richtlinien
- automatisierte Tests
- Continuous Integration
- Testabdeckung
- Performance-Richtlinien
- Release-Prozess

---

# Zusammenfassung

Die Entwicklungsrichtlinien definieren die gemeinsamen Grundsätze des Smart Humidity Control Framework.

Sie stellen sicher, dass Dokumentation, Referenzimplementierung, Blueprint und spätere native Home-Assistant-Integration langfristig konsistent weiterentwickelt werden.

Dabei stehen Verständlichkeit, Modularität, Herstellerunabhängigkeit und Wartbarkeit stets im Mittelpunkt.
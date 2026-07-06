# Installationsanleitung

## Zweck

Dieses Dokument beschreibt die Installation des Smart Humidity Control Framework.

Es erläutert die notwendigen Voraussetzungen sowie die verschiedenen Installationswege.

Die konkrete Vorgehensweise hängt von der jeweils verwendeten Implementierung ab.

---

# Installationsvarianten

Das Framework kann zukünftig auf drei verschiedene Arten installiert werden.

```text
Referenzimplementierung

↓

Automation Blueprint

↓

Native Home Assistant Integration
```

Alle drei Varianten basieren auf derselben Architektur und stellen dieselbe Funktionalität bereit.

---

# Voraussetzungen

Vor der Installation sollten folgende Voraussetzungen erfüllt sein.

## Home Assistant

- Aktuelle Home Assistant Version
- Schreibzugriff auf die Konfiguration
- Grundkenntnisse im Umgang mit Home Assistant

---

## Hardware

Mindestens erforderlich sind

- Referenzgerät (aktuell: Luftentfeuchter)
- Temperatur- und Feuchtesensor
- Schaltbare Steckdose oder Relais

Empfohlen werden zusätzlich

- Leistungsmessung
- Energieverbrauchsmessung
- Kontinuierlicher Kondensatablauf

---

# Referenzimplementierung

Die Referenzimplementierung dient als Grundlage für Entwicklung, Tests und Dokumentation.

Die Installation erfolgt derzeit manuell.

Hierzu gehören unter anderem

- Helfer
- Template-Sensoren
- Controller
- Automationen
- Referenzdashboard

Diese Installationsart eignet sich insbesondere zum Verständnis des Frameworks sowie zur Entwicklung neuer Funktionen.

---

# Installation über Automation Blueprint

Der Automation Blueprint stellt die empfohlene Installationsmethode für die meisten Benutzer dar.

Der Automation Blueprint übernimmt die Einrichtung der benötigten Komponenten.

Der Benutzer konfiguriert lediglich

- verwendetes Referenzgerät
- Sensor
- Schaltkomponente
- gewünschte Grundeinstellungen

Nach Abschluss der Einrichtung steht ein vollständig funktionsfähiges Framework zur Verfügung.

---

# Native Home Assistant Integration

Langfristig soll das Framework als native Home Assistant Integration bereitgestellt werden.

Die Integration übernimmt die vollständige Einrichtung.

Der Benutzer wählt lediglich die verwendeten Geräte aus.

Alle weiteren Komponenten werden automatisch erstellt und verwaltet.

---

# Dashboard

Für Referenzimplementierung und Automation Blueprint kann eine Referenzdashboard-Vorlage bereitgestellt werden.

Sie basiert auf dem Referenzdashboard der Referenzimplementierung und kann bei Bedarf individuell angepasst werden.

Eine spätere native Home Assistant Integration kann zusätzliche Dashboard-Unterstützung bereitstellen.

---

# Aktualisierung

Neue Versionen des Frameworks sollen bestehende Installationen möglichst übernehmen können.

Die Aktualisierung soll bestehende Konfigurationen, Feuchteprofile und Benutzereinstellungen möglichst unverändert erhalten.

---

# Migration

Der Wechsel zwischen den verschiedenen Installationsvarianten soll möglichst einfach sein.

Geplant sind insbesondere

- Referenzimplementierung → Automation Blueprint
- Automation Blueprint → Native Home Assistant Integration

Die fachliche Konfiguration des Frameworks soll hierbei erhalten bleiben.

---

# Fehlerdiagnose

Bei Problemen sollten zunächst folgende Punkte überprüft werden.

- Sensor liefert gültige Messwerte.
- Referenzgerät startet nach Spannungswiederkehr automatisch.
- Steckdose oder Relais schaltet korrekt.
- Controller befindet sich nicht im Betriebsmodus **Aus**.
- Geräte sind erreichbar.

Weitere Diagnoseinformationen stellt das Referenzdashboard bereit.

---

# Zukunft

Geplante Erweiterungen umfassen unter anderem

- automatische Dashboard-Erstellung
- automatische Geräteerkennung
- automatische Übernahme bekannter Geräteeigenschaften
- Installationsassistent
- automatische Migration zwischen Automation Blueprint und nativer Home Assistant Integration

---

# Zusammenfassung

Das Smart Humidity Control Framework unterstützt mehrere Installationswege.

Die Referenzimplementierung dient Entwicklung und Dokumentation.

Der Automation Blueprint stellt die empfohlene Installationsmethode für die meisten Benutzer der aktuellen Framework-Version dar.

Langfristig soll eine native Home Assistant Integration die vollständige Einrichtung des Frameworks übernehmen.
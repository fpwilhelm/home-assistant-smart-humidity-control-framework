# Dashboard Design

## Zweck

Dieses Dokument beschreibt die Benutzeroberfläche der Referenzimplementierung des Smart Humidity Control Framework.

Das Dashboard ermöglicht die Überwachung und Steuerung des Frameworks sowie die Darstellung aller relevanten Informationen zum aktuellen Raumklima und zum Referenzgerät.

In der aktuellen Referenzimplementierung ist das Referenzgerät ein Luftentfeuchter.

Das aktuelle Referenzdashboard dient als Referenzimplementierung für den ersten Automation Blueprint. Zukünftige Versionen können erweitert werden, ohne die grundlegende Struktur zu verändern.

---

# Designziele

Das Dashboard verfolgt folgende Ziele.

- Übersichtliche Darstellung
- Einfache Bedienung
- Wichtige Informationen auf einen Blick
- Klare Trennung zwischen Informationen, Aktionen und Warnungen
- Erweiterbarkeit für zukünftige Funktionen

---

# Dashboardbereiche

Das Dashboard ist in fünf fachliche Bereiche gegliedert.

```text
Status

↓

Steuerung

↓

Raumklima

↓

Leistung & Energie

↓

Diagnose
```

Diese Struktur bleibt unabhängig von der konkreten Darstellung in Home Assistant erhalten.

---

# Status

Der Statusbereich zeigt den aktuellen Betriebszustand des Frameworks.

## Informationen

- Betriebsmodus
- Betriebsstatus
- Zeitbetrieb aktiv
- Restlaufzeit des Zeitbetriebs

Der Benutzer soll jederzeit erkennen können, welche Entscheidung der Controller aktuell getroffen hat und warum sich das Referenzgerät im aktuellen Betriebszustand befindet.

---

# Steuerung

Der Steuerungsbereich enthält sämtliche vom Benutzer veränderbaren Einstellungen.

## Aktionen

- Betriebsmodus auswählen
- Feuchteprofil auswählen
- Regelcharakteristik auswählen
- Zielwertmodus auswählen
- Benutzerdefinierte Ziel-Luftfeuchtigkeit einstellen
- Zeitbetrieb starten

Die Anordnung soll eine intuitive Bedienung ermöglichen.

---

# Raumklima

Dieser Bereich visualisiert den aktuellen Zustand des Raumklimas.

## Informationen

- Aktuelle relative Luftfeuchtigkeit
- Ziel-Luftfeuchtigkeit
- Zielbereich
- Raumtemperatur

Der Zielbereich visualisiert den empfohlenen Feuchtebereich zwischen Ziel-Luftfeuchtigkeit und Einschaltgrenze.

Er dient ausschließlich der Visualisierung und besitzt keine eigene regelungstechnische Funktion.

## Geplante Erweiterungen

- Taupunkt
- Ziel-Taupunkt
- Absolute Luftfeuchtigkeit
- Raumklimabewertung

---

# Leistung & Energie

Dieser Bereich zeigt den aktuellen Betriebszustand des Referenzgeräts.

## Informationen

- Aktuelle Leistungsaufnahme
- Energieverbrauch
- Gerätestatus

## Geplante Erweiterungen

- Geschätzter Tankfüllstand
- Gemessener Tankfüllstand
- Entfeuchtungsleistung
- Laufzeitstatistik

---

# Diagnose

Der Diagnosebereich unterstützt den Benutzer bei der Überwachung des Systems.

## Informationen

- Sensorstatus
- Controllerstatus

## Warnungen

Warnungen weisen auf Zustände hin, die eine Benutzeraktion erfordern.

Beispiele

- Tank bald leeren
- Tank voll
- Sensorfehler
- Luftentfeuchter nicht erreichbar
- Temperatur außerhalb des empfohlenen Arbeitsbereichs

Warnungen sollen eindeutig erkennbar sein und den Benutzer bei Bedarf zum Handeln auffordern.

---

# Informationsgruppen

Das Dashboard unterscheidet bewusst zwischen drei Arten von Informationen.

## Informationen

Zeigen den aktuellen Zustand.

Beispiele

- aktuelle relative Luftfeuchtigkeit
- Ziel-Luftfeuchtigkeit
- Leistungsaufnahme
- Energieverbrauch
- Betriebsstatus

---

## Aktionen

Ermöglichen dem Benutzer Änderungen am System.

Beispiele

- Betriebsmodus ändern
- Feuchteprofil ändern
- Regelcharakteristik ändern
- Zeitbetrieb starten

---

## Warnungen

Weisen auf Zustände hin, die eine Benutzeraktion erfordern.

Warnungen können sowohl auf berechneten Werten als auch auf zusätzlichen Sensoren basieren.

---

# Referenzimplementierung

Das aktuelle Home-Assistant-Referenzdashboard bildet die Referenzimplementierung des Frameworks.

Es verwendet die in der Referenzimplementierung vorhandenen Home-Assistant-Entitäten.

Der erste Automation Blueprint orientiert sich an diesem Dashboard und soll dessen grundlegendes Bedienkonzept übernehmen.

Eine spätere native Home Assistant Integration kann zusätzliche Informationen und Komfortfunktionen bereitstellen, ohne die grundlegende Struktur zu verändern.

---

# Entwurfsprinzipien

## Informationsorientiert

Das Dashboard beschreibt Informationsbereiche und keine konkreten Home-Assistant-Karten.

---

## Konsistent

Alle dargestellten Informationen basieren auf den vom Framework berechneten Werten.

---

## Erweiterbar

Neue Informationen können ergänzt werden, ohne die bestehende Struktur zu verändern.

---

## Benutzerfreundlich

Wichtige Informationen sollen jederzeit ohne Navigation sichtbar sein.

Komplexere Funktionen dürfen ergänzt werden, ohne die Bedienung der Grundfunktionen zu erschweren.

---

# Zukunft

Geplante Erweiterungen umfassen unter anderem

- Tankfüllstandsanzeige
- Tankfüllstandsschätzung
- Tankwarnungen
- Taupunktdarstellung
- Absolute Luftfeuchtigkeit
- Schimmelrisikobewertung
- Lüftungsempfehlungen
- Energieauswertungen
- Langzeitstatistiken
- Unterstützung mehrerer Luftentfeuchter

Zukünftige Dashboard-Implementierungen können sich vom aktuellen Referenzdashboard unterscheiden, stellen jedoch dieselben fachlichen Framework-Werte dar.

---

# Zusammenfassung

Das Referenzdashboard bildet die zentrale Benutzeroberfläche der aktuellen Referenzimplementierung des Smart Humidity Control Framework.

Es stellt sämtliche relevanten Informationen übersichtlich dar, ermöglicht eine intuitive Bedienung und unterstützt den Benutzer durch Warnungen sowie zukünftige Diagnose- und Analysefunktionen.

Das aktuelle Referenzdashboard dient als Grundlage für den ersten Automation Blueprint und entwickelt sich gemeinsam mit dem Framework kontinuierlich weiter.
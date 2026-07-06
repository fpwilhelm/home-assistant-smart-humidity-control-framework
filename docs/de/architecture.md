# Architektur

## Projektziel

Das **Home Assistant Smart Humidity Control Framework** ist ein universelles und modulares Framework zur intelligenten Regelung der Luftfeuchtigkeit in Innenräumen.

Im Gegensatz zu klassischen Luftentfeuchter-Automationen schaltet das Framework nicht lediglich einen Luftentfeuchter anhand einer festen Luftfeuchtigkeitsschwelle.

Stattdessen kombiniert es Feuchteprofile, Zielwerte, Regelcharakteristiken, Geräteparameter und Sensorinformationen zu einer intelligenten Regelstrategie.

Das Framework ist herstellerunabhängig und soll mit möglichst vielen Luftentfeuchtern kompatibel sein.

Langfristig soll die Architektur weitere Aktoren wie Lüftungsanlagen, Fensterantriebe oder Ventilatoren unterstützen.

---

# Projektphilosophie

Das Smart Humidity Control Framework basiert auf folgenden Grundprinzipien.

## Herstellerunabhängig

Das Framework ist nicht an einen bestimmten Hersteller oder Gerätetyp gebunden.

Voraussetzung ist lediglich, dass der verwendete Aktor die gewünschte Regelstrategie unterstützt.

Bei einem Luftentfeuchter bedeutet dies beispielsweise:

- Dauerbetrieb möglich
- automatischer Wiederanlauf nach Spannungswiederkehr
- Beibehaltung der eingestellten Betriebsparameter

Die eigentliche Regelung übernimmt ausschließlich Home Assistant.

---

## Modular

Der Benutzer entscheidet selbst, welche Sensoren und Funktionen verwendet werden.

### Pflichtkomponenten

- geeigneter Aktor (aktuell Luftentfeuchter)
- Temperaturmessung
- Luftfeuchtigkeitsmessung
- schaltbare Steckdose oder anderer geeigneter Schaltaktor

### Empfohlene Komponenten

- Leistungsmessung
- Energieverbrauchsmessung

### Optionale Komponenten

- Außentemperatur
- Außenluftfeuchtigkeit
- Außentaupunkt
- Wandtemperatur
- Fensterkontakte
- Lüftungsanlage
- weitere Sensoren

Das Framework erweitert seine Fähigkeiten automatisch, sobald zusätzliche Komponenten verfügbar sind.

---

## Erweiterbar

Das Framework entwickelt sich schrittweise.

```text
Version 1
Grundregelung

↓

Version 2
Taupunkt und Außenklima

↓

Version 3
Bauphysikalische Bewertung

↓

Version 4
Adaptive Feuchteregelung
```

---

## Einsteigerfreundlich

Bereits mit einer einfachen Ausstattung soll das Framework vollständig nutzbar sein.

Benötigt werden lediglich:

- Temperatur
- Luftfeuchtigkeit
- schaltbarer Aktor

Alle weiteren Funktionen sind optional.

---

# Architekturmodell

Das Smart Humidity Control Framework besteht aus vier logisch voneinander getrennten Ebenen.

Jede Ebene besitzt eine klar definierte Aufgabe und kann unabhängig von den anderen weiterentwickelt werden.

```text
┌────────────────────────────────────────────────────────────┐
│ Ebene 1 – Hardware                                         │
│                                                            │
│ Aktoren                                                    │
│ Sensoren                                                   │
│ optionale Komponenten                                      │
└────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────────┐
│ Ebene 2 – Geräte- und Installationsparameter               │
│                                                            │
│ Nennleistung                                               │
│ Gauge-Maximum                                              │
│ Tankgröße                                                  │
│ Sensorzuordnung                                            │
│ Geräteparameter                                            │
└────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────────┐
│ Ebene 3 – Regelung                                         │
│                                                            │
│ Betriebsmodus                                              │
│ Feuchteprofil                                              │
│ Regelcharakteristik                                               │
│ Zielwertmodus                                              │
│ Zielwert                                                   │
│ Hysterese                                                  │
│ Controller                                                 │
└────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────────┐
│ Ebene 4 – Visualisierung                                   │
│                                                            │
│ Dashboard                                                  │
│ Betriebsstatus                                             │
│ Gauges                                                     │
│ Diagramme                                                  │
│ Statistiken                                                │
└────────────────────────────────────────────────────────────┘
```

## Ebene 1 – Hardware

Diese Ebene umfasst sämtliche physischen Komponenten.

Dazu gehören Aktoren, Sensoren und weitere optionale Geräte.

Die Hardware ist vollständig austauschbar und unabhängig vom eigentlichen Regelalgorithmus.

---

## Ebene 2 – Geräte- und Installationsparameter

Diese Ebene beschreibt die Eigenschaften der installierten Geräte und der Installation.

Sie enthält ausschließlich Konfigurationsdaten und keine Regelungslogik.

Beispiele:

- Nennleistung
- maximale Leistungsaufnahme
- Tankgröße
- Sensorzuordnung
- Dauerablauf

---

## Ebene 3 – Regelung

Dies ist das Herzstück des Frameworks.

Hier werden Messwerte ausgewertet, Zielwerte berechnet und daraus die Regelstrategie bestimmt.

Die Regelung arbeitet ausschließlich mit Eigenschaften und Parametern.

Sie kennt weder konkrete Räume noch bestimmte Geräte oder Hersteller.

Ein Feuchteprofil beschreibt einen typischen Anwendungsfall und definiert insbesondere den empfohlenen Basiswert der relativen Luftfeuchtigkeit.

Beispiele für Feuchteprofile:

- Wohnraum
- Schlafzimmer
- Keller unbeheizt
- Garage
- Archiv
- Weinkeller
- Instrumentenlager
- Neubautrocknung

Langfristig sollen neben den Standardprofilen auch benutzerdefinierte Feuchteprofile unterstützt werden.

---

## Ebene 4 – Visualisierung

Diese Ebene stellt alle Informationen für den Benutzer bereit.

Sie umfasst Dashboards, Gauges, Diagramme, Statistiken und Statusanzeigen.

Die Visualisierung besitzt keinerlei Einfluss auf die eigentliche Regelungslogik.

---

# Voraussetzungen

## Pflicht

- geeigneter Aktor
- Temperaturmessung
- Luftfeuchtigkeitsmessung
- schaltbarer Aktor oder schaltbare Steckdose

Bei Luftentfeuchtern zusätzlich:

- Dauerbetrieb
- automatischer Wiederanlauf nach Spannungswiederkehr

## Empfohlen

- Leistungsmessung
- Energieverbrauchsmessung

## Optional

- Außensensoren
- Taupunkt außen
- Wandtemperatur
- weitere Sensoren

---

# Zukunft

Langfristig soll aus dem Smart Humidity Control Framework eine vollständige Home Assistant Integration entstehen.

Diese soll unter anderem folgende Funktionen bereitstellen:

- Standard-Feuchteprofile
- benutzerdefinierte Feuchteprofile
- Geräteverwaltung
- Dashboard
- Blueprint
- intelligente Feuchteregelung
- bauphysikalische Bewertung
- Unterstützung mehrerer Aktoren
- erweiterbare Sensorik
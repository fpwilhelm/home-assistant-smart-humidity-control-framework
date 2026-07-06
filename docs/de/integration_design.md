# Integrationsdesign

## Zweck

Dieses Dokument beschreibt den geplanten Aufbau der zukünftigen **Smart Humidity Control Integration** für Home Assistant.

Es definiert die Architektur der Integration, ihre Komponenten, den Datenfluss sowie die Verantwortlichkeiten der einzelnen Module.

Dieses Dokument beschreibt die Zielarchitektur und ist unabhängig von der aktuellen Blueprint-Implementierung.

---

# Ziele

Die Integration soll

- mehrere Luftentfeuchter unterstützen
- beliebig viele Räume verwalten können
- vollständig über die Home-Assistant-Benutzeroberfläche konfigurierbar sein
- ohne YAML nutzbar sein
- alle relevanten Entitäten automatisch erzeugen
- leicht erweiterbar sein
- vollständig dokumentiert sein

---

# Integrationsübersicht

Die Integration besteht aus mehreren logisch getrennten Komponenten.

```text
Smart Humidity Control

├── Konfiguration
├── Geräteverwaltung
├── Controller
├── Profilverwaltung
├── Laufzeitdaten
├── Entitäten
├── Dashboard
└── Diagnose
```

Jede Komponente besitzt klar definierte Aufgaben und Schnittstellen.

---

# Konfiguration

Die Konfiguration erfolgt vollständig über Config Entries.

Der Benutzer wählt unter anderem

- Luftentfeuchter
- Schaltbare Steckdose
- Luftfeuchtigkeitssensor
- Temperatursensor
- Energiezähler
- Leistungsaufnahme
- Standardprofil
- Standard-Schutzniveau

Die Integration erzeugt anschließend automatisch alle benötigten Entitäten.

---

# Geräteverwaltung

Die Geräteverwaltung verwaltet alle physikalischen Geräte.

Hierzu gehören beispielsweise

- Luftentfeuchter
- Steckdosen
- Sensoren
- Leistungsmessung
- Energieverbrauch

Die Geräteverwaltung stellt diese Informationen dem Controller zur Verfügung.

---

# Controller

Der Controller bildet das Herzstück der Integration.

Er übernimmt sämtliche Steuerungsentscheidungen.

Dazu gehören unter anderem

- Sollwertberechnung
- Hysterese
- Ein- und Ausschalten
- Betriebsmodus
- Zeitbetrieb
- Mindestlaufzeit
- Mindestpause
- Sicherheitsfunktionen

Der Controller trifft ausschließlich logische Entscheidungen.

Die eigentliche Kommunikation mit Home Assistant erfolgt über die Entitäten.

---

# Profilverwaltung

Die Profilverwaltung verwaltet sämtliche Raumprofile.

Jedes Profil definiert unter anderem

- Basis-Luftfeuchtigkeit
- zulässigen Bereich
- empfohlene Hysterese
- Beschreibung

Die Integration enthält vordefinierte Standardprofile.

Benutzer können später zusätzlich eigene Profile erstellen.

---

# Laufzeitdaten

Während des Betriebs speichert die Integration verschiedene Laufzeitinformationen.

Beispiele

- aktueller Sollwert
- Betriebsmodus
- Betriebsstatus
- aktive Hysterese
- Restlaufzeit
- letzte Schaltung
- Laufzeitstatistik

Diese Daten dienen sowohl der Steuerung als auch der Visualisierung.

---

# Entitäten

Die Integration erzeugt automatisch alle benötigten Home-Assistant-Entitäten.

Dazu gehören beispielsweise

## Sensoren

- aktuelle Luftfeuchtigkeit
- Temperatur
- Sollwert
- Zielbereich
- Betriebsstatus
- Leistungsaufnahme
- Energieverbrauch

## Selects

- Raumprofil
- Schutzniveau
- Betriebsmodus

## Numbers

- Zielwert
- Hysterese
- Zeitbetrieb

## Switches

- Automatik aktiv
- Controller aktiv

## Buttons

- Zeitbetrieb starten
- Zeitbetrieb abbrechen
- Statistiken zurücksetzen

## Binary Sensoren

- Entfeuchter läuft
- Zielbereich erreicht
- Zeitbetrieb aktiv
- Fehlerzustand

---

# Dashboard

Die Integration stellt alle erforderlichen Informationen für ein Dashboard bereit.

Das Dashboard selbst gehört jedoch nicht zur Integration.

Es verwendet ausschließlich die von der Integration bereitgestellten Entitäten.

Dadurch können beliebige Dashboards erstellt werden.

---

# Diagnose

Die Integration stellt umfangreiche Diagnoseinformationen bereit.

Beispiele

- aktuelle Regelentscheidung
- letzte Schaltung
- Sperrgrund
- aktive Betriebsart
- Controllerzustand
- Sensorstatus

Diese Informationen erleichtern Fehlersuche und Support.

---

# Erweiterbarkeit

Die Architektur ist modular aufgebaut.

Dadurch können zukünftige Funktionen ergänzt werden, ohne bestehende Installationen zu verändern.

Geplante Erweiterungen

- mehrere Luftentfeuchter pro Raum
- Taupunktregelung
- Außentemperatur
- Fensterkontakte
- Lüftungssteuerung
- Wettervorhersage
- Energieoptimierung
- Zeitprogramme
- Automatische Profilvorschläge

---

# Verhältnis zum Blueprint

Der aktuelle Blueprint bildet die erste Ausbaustufe des Projekts.

Die spätere Integration übernimmt die bewährte Steuerungslogik des Blueprints und erweitert sie um

- grafische Konfiguration
- automatische Entitätenerstellung
- bessere Diagnose
- höhere Erweiterbarkeit
- einfachere Bedienung

Dadurch bleibt der Umstieg auf die Integration für bestehende Anwender möglichst einfach.

---

# Designprinzipien

Die Integration folgt den folgenden Grundprinzipien.

- Home-Assistant-Standardkonformität
- klare Trennung der Verantwortlichkeiten
- möglichst wenig Benutzerkonfiguration
- automatische Einrichtung
- nachvollziehbare Steuerungsentscheidungen
- vollständige Diagnose
- hohe Wiederverwendbarkeit
- einfache Erweiterbarkeit
- langfristige Wartbarkeit

---

# Zusammenfassung

Die Smart Humidity Control Integration stellt eine vollständig integrierte Lösung zur intelligenten Steuerung von Luftentfeuchtern in Home Assistant dar.

Sie baut auf der im Blueprint entwickelten Steuerungslogik auf und erweitert diese um eine moderne, modulare und vollständig konfigurierbare Architektur.
# Integrationsdesign

Dieses Dokument beschreibt die langfristige Architektur der nativen **Smart Humidity Control Framework** Integration für Home Assistant.

Es definiert, wie sich das Framework von der aktuellen Referenzimplementierung zu einer vollständig integrierten Home-Assistant-Komponente weiterentwickeln soll.

Das Dokument beschreibt ausschließlich die fachliche Architektur und ist bewusst unabhängig von Implementierungsdetails.

---

# Ziel

Die native Integration soll den vollständigen Funktionsumfang des Smart Humidity Control Framework bereitstellen, ohne dass Benutzer Helfer, Template-Sensoren, Automationen oder Dashboards manuell erstellen müssen.

Die Integration übernimmt die automatische Erstellung und Verwaltung sämtlicher Framework-Komponenten.

---

# Entwurfsprinzipien

Die Integration folgt den grundlegenden Prinzipien des Smart Humidity Control Framework.

- herstellerunabhängig
- modular
- nachvollziehbar
- erweiterbar
- wiederverwendbar
- einfach konfigurierbar

Der zugrunde liegende Regelalgorithmus bleibt identisch zur Referenzimplementierung.

Lediglich die technische Umsetzung ändert sich.

---

# Architektur

Die native Integration stellt eine mögliche Implementierung der Framework-Architektur dar.

```text
Smart Humidity Control Framework
                │
                ▼
Native Home Assistant Integration
                │
                ▼
Konfiguration
                │
                ▼
Framework-Komponenten
                │
                ▼
Controller
                │
                ▼
Schaltgerät
                │
                ▼
Referenzgerät
```

Die Architektur des Frameworks bleibt dabei vollständig unabhängig von Home Assistant.

---

# Konfiguration

Die Integration stellt eine grafische Benutzeroberfläche zur Verfügung.

Benutzer sollen keine YAML-Dateien bearbeiten müssen.

Für sämtliche Konfigurationsaufgaben werden verwendet:

- Config Flow
- Options Flow

---

# Framework-Komponenten

Die Integration verwaltet sämtliche benötigten Framework-Komponenten automatisch.

Dazu gehören beispielsweise:

- Feuchteprofile
- Regelcharakteristiken
- Zielwertmodi
- Betriebsmodi
- Gerätekonfiguration
- Template-Sensoren
- Controller
- Diagnosefunktionen

Der Benutzer konfiguriert das Framework und nicht einzelne Home-Assistant-Entitäten.

---

# Gerätekonfiguration

Jedes unterstützte Gerät wird anhand seiner technischen Eigenschaften beschrieben.

Beispiele:

- Nennleistung
- Entfeuchtungsleistung
- Tankvolumen
- Kondensatbetrieb
- unterstützte Betriebsarten
- automatischer Wiederanlauf

Diese Informationen dienen sowohl der Regelung als auch zukünftigen Diagnose- und Optimierungsfunktionen.

---

# Controller

Der native Controller implementiert dieselbe fachliche Logik wie die Referenzimplementierung.

Zu seinen Aufgaben gehören:

- Verwaltung der Betriebsmodi
- Hystereseregelung
- Zeitbetrieb
- Sofortaktivierung nach Zielwertänderungen
- Berechnung des Betriebsstatus
- Ansteuerung des Schaltgeräts

Der Regelalgorithmus bleibt in allen Implementierungen identisch.

---

# Diagnose

Die Integration soll integrierte Diagnosefunktionen bereitstellen.

Beispiele:

- Sensorprüfung
- Konfigurationsprüfung
- Geräteverfügbarkeit
- Betriebsstatus
- Betriebsstatistiken
- Warnmeldungen

Spätere Versionen können zusätzlich bereitstellen:

- geschätzter Tankfüllstand
- Wartungshinweise
- Effizienzbewertung

---

# Dashboard-Generierung

Die Integration soll optional ein vollständiges Dashboard erzeugen.

Dieses umfasst unter anderem:

- Betriebssteuerung
- Luftfeuchtigkeitsanzeige
- Zielbereich
- Betriebsstatus
- Leistungsüberwachung
- Energieüberwachung
- Warnmeldungen
- Diagnoseinformationen

Das erzeugte Dashboard soll anschließend individuell angepasst werden können.

---

# Geräteunterstützung

Das Framework unterstützt unterschiedliche Schaltgeräte.

Beispiele:

- Smart Plugs
- Relais
- Shelly-Geräte
- Schütze

Das Referenzgerät bleibt der Luftentfeuchter.

Zukünftige Versionen können weitere Strategien zur Reduzierung der Luftfeuchtigkeit unterstützen.

---

# Zukünftige Erweiterungen

Die Architektur wurde so entwickelt, dass zukünftige Funktionen ohne grundlegende Änderungen ergänzt werden können.

Beispiele:

- mehrere Luftentfeuchter
- Lüftungsanlagen
- Ventilatoren
- automatische Fenstersteuerung
- adaptive Regelalgorithmen
- lernfähige Feuchteprofile
- Taupunktregelung
- Schimmelrisikobewertung
- Gebäudetrocknung
- mehrere Strategien zur Feuchtereduzierung

---

# Migration

Die Referenzimplementierung bildet den Migrationspfad zur nativen Integration.

```text
Referenzimplementierung
            │
            ▼
Automation Blueprint
            │
            ▼
Native Home Assistant Integration
```

Benutzer sollen auf die nächste Entwicklungsstufe wechseln können, ohne die grundlegende Arbeitsweise des Frameworks ändern zu müssen.

---

# Zusammenfassung

Die native Home Assistant Integration stellt das langfristige Entwicklungsziel des Smart Humidity Control Framework dar.

Sie übernimmt die vollständige Verwaltung sämtlicher Framework-Komponenten und ersetzt die manuelle Home-Assistant-Konfiguration durch eine integrierte, benutzerfreundliche Lösung.

Die fachliche Architektur des Frameworks bleibt dabei unabhängig von Herstellern, Geräten und zukünftigen Implementierungstechnologien bestehen.
# Automation Blueprint

## Zweck

Dieses Dokument beschreibt den Home-Assistant-Blueprint des Smart Humidity Control Framework.

Der Blueprint stellt die vollständige Referenzimplementierung des Frameworks innerhalb von Home Assistant bereit.

Er ermöglicht die einfache Einrichtung eines intelligenten Luftentfeuchters, ohne dass Benutzer die komplette Logik selbst erstellen müssen.

Der Blueprint bildet die Brücke zwischen der Referenzimplementierung und einer zukünftigen nativen Home-Assistant-Integration.

---

# Ziel

Der Blueprint verfolgt folgende Ziele.

- Einfache Installation
- Herstellerunabhängigkeit
- Wiederverwendbarkeit
- Konsistente Benutzeroberfläche
- Möglichst geringe manuelle Konfiguration

Nach der Einrichtung soll der Benutzer ein vollständig funktionsfähiges Framework erhalten.

---

# Architektur

Der Blueprint bildet sämtliche Komponenten des Frameworks innerhalb von Home Assistant ab.

```text
Blueprint

        │

        ▼

Konfiguration

        │

        ▼

Framework

        │

        ▼

Controller

        │

        ▼

Luftentfeuchter
```

Der Blueprint implementiert dabei dieselbe Architektur wie die Referenzimplementierung.

---

# Benutzereingaben

Während der Einrichtung fragt der Blueprint die benötigten Informationen ab.

## Geräte

- Luftentfeuchter
- Schaltbare Steckdose oder Relais
- Temperatur- und Feuchtesensor

---

## Geräteeigenschaften

- Dauerbetrieb möglich
- Automatischer Wiederanlauf
- Art der Kondensatableitung

Empfohlene Angaben

- Nennleistung
- Maximale Entfeuchtungsleistung
- Tankvolumen

---

## Grundeinstellungen

- Feuchteprofil
- Regelcharakteristik
- Zielwertmodus

Optional

- Benutzerdefinierte Ziel-Luftfeuchtigkeit

---

# Vom Blueprint bereitgestellte Komponenten

Der Blueprint stellt sämtliche Bestandteile der Referenzimplementierung bereit.

## Helfer

Alle erforderlichen Home-Assistant-Helfer.

---

## Template-Sensoren

Alle berechneten Sensoren des Frameworks.

---

## Controller

Die vollständige Regelungslogik.

---

## Automationen

Alle zur Steuerung benötigten Automationen.

---

## Dashboard

Optional kann eine Dashboard-Vorlage bereitgestellt werden, die sich am Referenzdashboard orientiert.

---

# Unterstützte Geräte

Der Blueprint arbeitet herstellerunabhängig.

Unterstützt werden grundsätzlich alle Luftentfeuchter,

- die einen Dauerbetrieb unterstützen,
- nach Spannungswiederkehr automatisch starten,
- und über eine schaltbare Steckdose oder ein Relais betrieben werden können.

---

# Benutzerfreundlichkeit

Der Benutzer soll möglichst keine YAML-Dateien bearbeiten müssen.

Alle erforderlichen Einstellungen sollen über den Blueprint erfolgen.

Nach Abschluss der Einrichtung soll das Framework unmittelbar einsatzbereit sein.

---

# Referenzimplementierung

Der Blueprint orientiert sich vollständig an der Referenzimplementierung des Smart Humidity Control Framework.

Dashboard, Controller, Template-Sensoren und Helfer sollen sich identisch verhalten.

Dadurch können Blueprint und Referenzimplementierung jederzeit miteinander verglichen werden.

---

# Erweiterbarkeit

Der Blueprint soll zukünftige Erweiterungen unterstützen.

Beispiele

- mehrere Luftentfeuchter
- mehrere Sensoren
- zusätzliche Warnungen
- Tankfüllstandsensor
- Lüftungsanlage
- Ventilator
- Sonderprogramme
- neue Feuchteprofile

Bestehende Installationen sollen hierbei möglichst unverändert weiter funktionieren.

---

# Übergang zur nativen Integration

Der Blueprint stellt die erste vollständige Implementierung des Frameworks dar.

Eine spätere native Home-Assistant-Integration soll dieselbe Funktionalität bereitstellen.

Der Übergang zur Integration soll für bestehende Benutzer möglichst einfach erfolgen.

---

# Entwurfsprinzipien

## Herstellerunabhängig

Der Blueprint darf keine Eigenschaften eines bestimmten Herstellers voraussetzen.

---

## Modular

Neue Komponenten sollen ergänzt werden können, ohne bestehende Installationen zu verändern.

---

## Wiederverwendbar

Ein Blueprint soll beliebig viele Luftentfeuchter unterstützen.

---

## Konsistent

Blueprint und Referenzimplementierung sollen sich identisch verhalten.

---

## Zukunftssicher

Der Blueprint bildet die Grundlage für die spätere native Home-Assistant-Integration.

---

# Zukunft

Geplante Erweiterungen umfassen unter anderem

- automatische Dashboard-Erstellung
- automatische Gerätevorschläge
- Unterstützung bekannter Luftentfeuchtermodelle
- automatische Übernahme von Geräteeigenschaften
- Tankfüllstandsschätzung
- Tankfüllstandsensoren
- mehrere Luftentfeuchter
- Mehrzonenbetrieb
- zentrale Framework-Verwaltung

---

# Zusammenfassung

Der Blueprint stellt die vollständige Referenzimplementierung des Smart Humidity Control Framework innerhalb von Home Assistant bereit.

Er ermöglicht die einfache Einrichtung eines intelligenten Luftentfeuchters und bildet gleichzeitig die Grundlage für die spätere native Home-Assistant-Integration.

Der Blueprint ist damit nicht nur eine Automation, sondern die erste installierbare Version des gesamten Frameworks.
# Regelalgorithmus

Dieses Dokument beschreibt den Regelalgorithmus des Smart Humidity Control Frameworks.

Es definiert die fachliche Funktionsweise des Controllers unabhängig von Home Assistant, YAML, Blueprint oder einer nativen Integration.

Der Algorithmus bildet das Herzstück des Frameworks.

---

# Ziel

Der Controller soll die relative Luftfeuchtigkeit eines Raumes möglichst energieeffizient auf den gewünschten Zielwert regeln.

Dabei sollen

- häufiges Schalten vermieden,
- der Energieverbrauch minimiert,
- unterschiedliche Luftentfeuchter unterstützt,
- verschiedene Anwendungsfälle abgebildet werden,
- und das Verhalten jederzeit nachvollziehbar bleiben.

---

# Architektur

Der Controller verarbeitet ausschließlich bereits berechnete Informationen.

Er führt selbst keine Berechnung von Zielwerten oder Hysteresen durch.

```text
Benutzer
   │
   ▼
Konfiguration
   │
   ▼
Berechnete Werte
   │
   ▼
Controller
   │
   ▼
Geräte
```

Dadurch bleibt der Regelalgorithmus einfach, nachvollziehbar und unabhängig von der verwendeten Implementierung.

---

# Eingänge

Der Controller verwendet ausschließlich folgende Informationen.

## Betriebsmodus

- Aus
- Automatik
- Dauerbetrieb
- Zeitbetrieb

## Messwerte

- aktuelle Luftfeuchtigkeit
- aktuelle Temperatur

## Berechnete Werte

- Ziel-Luftfeuchtigkeit
- Einschaltgrenze
- Hysterese
- Sollwertabweichung
- Entfeuchtungsbedarf

## Zeitsteuerung

- Timer aktiv
- verbleibende Laufzeit

## Optionale Schutzfunktionen

- Mindestlaufzeit
- Mindestpause

---

# Ausgänge

Der Controller darf ausschließlich folgende Komponenten beeinflussen.

- Luftentfeuchter
- Zeitbetrieb
- Betriebsmodus, zum Beispiel Rückkehr auf Automatik

Weitere Berechnungen erfolgen außerhalb des Controllers.

---

# Prioritäten

Die Betriebsarten und Schutzfunktionen besitzen eine feste Priorität.

```text
Fehler

↓

Sensorfehler

↓

Aus

↓

Dauerbetrieb

↓

Zeitbetrieb

↓

Optionale Schutzfunktionen

↓

Automatik
```

Die jeweils höher priorisierte Regel übersteuert alle darunterliegenden Regeln.

---

# Betriebsarten

## Aus

Der Luftentfeuchter bleibt ausgeschaltet.

Änderungen an

- Feuchteprofil
- Zielwert
- Regelcharakteristik

lösen keine automatische Aktivierung aus.

Erst nach Wechsel auf einen aktiven Betriebsmodus beginnt die Regelung.

---

## Dauerbetrieb

Der Luftentfeuchter bleibt dauerhaft eingeschaltet.

Sensorwerte werden weiterhin berechnet und angezeigt.

Sie beeinflussen den Betrieb jedoch nicht.

---

## Zeitbetrieb

Während eines aktiven Zeitbetriebs bleibt der Luftentfeuchter eingeschaltet.

Optional kann der Zeitbetrieb bei Zielerreichung

- beendet werden oder
- automatisch in den Automatikbetrieb wechseln.

Nach Ablauf des Timers erfolgt die konfigurierte Rückkehr in den gewählten Betriebsmodus.

---

## Automatik

Der Automatikbetrieb bildet den eigentlichen Regelalgorithmus.

Der Controller arbeitet mit einer Hysterese.

### Einschalten

```text
Ist-Luftfeuchtigkeit > Einschaltgrenze
```

↓

Luftentfeuchter einschalten

### Ausschalten

```text
Ist-Luftfeuchtigkeit ≤ Ziel-Luftfeuchtigkeit
```

↓

Luftentfeuchter ausschalten

Dadurch entsteht eine stabile Regelung ohne häufiges Ein- und Ausschalten.

---

# Sofortige Aktivierung

Wird der Zielwert vom Benutzer abgesenkt und liegt die aktuelle Luftfeuchtigkeit bereits oberhalb des neuen Zielwertes, beginnt der Automatikbetrieb sofort.

Die Hysterese wird in diesem Fall bewusst ignoriert.

Erst nach erstmaligem Erreichen des Zielwertes übernimmt die Hysterese wieder die normale Regelung.

Dadurch reagiert das System unmittelbar auf Benutzeränderungen, ohne die Stabilität der späteren Regelung zu beeinträchtigen.

---

# Optionale Schutzfunktionen

Der Controller kann zusätzliche Schutzfunktionen berücksichtigen.

Diese Funktionen sind nicht zwingend erforderlich, wenn ein Luftentfeuchter ausdrücklich für Dauerbetrieb geeignet ist.

Sie bleiben jedoch als optionale Erweiterung vorgesehen, damit auch andere Geräteklassen unterstützt werden können.

## Mindestlaufzeit

Nach dem Einschalten kann der Luftentfeuchter mindestens für eine definierte Zeit eingeschaltet bleiben.

Dies kann häufiges Ein- und Ausschalten reduzieren.

## Mindestpause

Nach dem Ausschalten kann der Luftentfeuchter mindestens für eine definierte Zeit ausgeschaltet bleiben.

Dies kann häufige Neustarts vermeiden.

---

# Sensorfehler

Vor jeder Regelentscheidung werden die erforderlichen Messwerte geprüft.

Ungültige Werte sind beispielsweise

- `unknown`
- `unavailable`
- leere Werte
- nicht numerische Werte
- offensichtlich unplausible Messwerte

Bei ungültigen Messwerten erfolgt keine automatische Schaltung.

Der Controller wechselt in den Zustand **Sensorfehler**.

---

# Zustandsmodell

Der Controller besitzt folgende logische Zustände.

```text
Aus

Automatik – Wartet

Automatik – Entfeuchtet

Automatik – Läuft nach

Automatik – Ziel erreicht

Dauerbetrieb

Zeitbetrieb aktiv

Zeitbetrieb beendet

Sensorfehler

Fehler
```

Diese Zustände werden durch den Betriebsstatus bereitgestellt.

---

# Entwurfsprinzipien

Der Regelalgorithmus folgt folgenden Grundsätzen.

## Herstellerunabhängig

Die Regelung darf keine Eigenschaften eines bestimmten Luftentfeuchters voraussetzen.

## Modular

Berechnungen erfolgen außerhalb des Controllers.

Der Controller trifft ausschließlich Entscheidungen.

## Nachvollziehbar

Alle Entscheidungen sollen jederzeit anhand der Sensorwerte nachvollziehbar sein.

## Erweiterbar

Neue Sensoren oder Regelstrategien sollen ergänzt werden können, ohne den bestehenden Algorithmus grundlegend zu verändern.

---

# Zukunft

Der Regelalgorithmus bildet die Grundlage für zukünftige Erweiterungen.

Geplant sind unter anderem

- adaptive Hysteresen
- lernfähige Feuchteprofile
- Taupunktregelung
- Schimmelrisikobewertung
- Lüftungsempfehlungen
- mehrere Luftentfeuchter
- Kombination mit Lüftungsanlagen
- Kombination mit Ventilatoren
- energieoptimierte Regelstrategien

Alle zukünftigen Funktionen sollen auf dem hier beschriebenen Regelalgorithmus aufbauen.
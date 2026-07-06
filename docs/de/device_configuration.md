# Gerätekonfiguration

## Zweck

Dieses Dokument beschreibt die technischen Voraussetzungen für den Betrieb des Smart Humidity Control Framework.

Es definiert die benötigten Geräte, Sensoren und Komponenten sowie deren Anforderungen.

Die beschriebenen Anforderungen gelten unabhängig von der verwendeten Home-Assistant-Implementierung.

---

# Architektur

Das Framework besteht in der aktuellen Ausbaustufe aus vier Komponenten.

```text
Sensoren
      │
      ▼
Controller
      │
      ▼
Schaltkomponente
      │
      ▼
Luftentfeuchter
```

Die einzelnen Komponenten können durch unterschiedliche Hersteller und Geräte realisiert werden.

---

# Pflichtkomponenten

Für den Betrieb des Framework werden mindestens folgende Komponenten benötigt.

- Luftentfeuchter
- Temperatur- und Feuchtesensor
- Schaltbare Steckdose oder Relais

---

# Luftentfeuchter

## Anforderungen

Der verwendete Luftentfeuchter sollte

- nach Spannungswiederkehr automatisch starten
- einen Dauerbetrieb unterstützen
- für externes Schalten geeignet sein

Diese Eigenschaften ermöglichen einen zuverlässigen Automatikbetrieb.

---

# Geräteeigenschaften

Neben den grundlegenden Anforderungen besitzt jeder Luftentfeuchter technische Eigenschaften, die vom Framework genutzt werden können.

Ein Teil dieser Eigenschaften ist für den Betrieb erforderlich, andere verbessern Komfort, Diagnose und zukünftige Optimierungen.

---

## Pflichtangaben

Folgende Eigenschaften sind für einen zuverlässigen Automatikbetrieb erforderlich.

| Eigenschaft | Beschreibung |
|-------------|--------------|
| Dauerbetrieb möglich | Das Gerät muss nach dem Einschalten dauerhaft weiterlaufen können. |
| Automatischer Wiederanlauf | Das Gerät muss nach einer Spannungsunterbrechung selbstständig den Betrieb fortsetzen. |
| Art der Kondensatableitung | Kontinuierlicher Kondensatablauf oder Tankbetrieb. |

---

## Empfohlene Angaben

Diese Eigenschaften verbessern zukünftige Berechnungen und Komfortfunktionen.

| Eigenschaft | Einheit | Verwendung |
|-------------|---------|------------|
| Nennleistung | W | Dashboard, Leistungsbewertung |
| Maximale Entfeuchtungsleistung | l / 24 h | Tankfüllstandsschätzung, Effizienzbewertung |
| Tankvolumen | l | Tankfüllstandsschätzung |

---

## Optionale Angaben

Weitere Geräteeigenschaften können zukünftig genutzt werden.

| Eigenschaft | Verwendung |
|-------------|------------|
| Luftvolumenstrom | Optimierung |
| Einsatztemperatur | Plausibilitätsprüfung |
| Automatische Abtaufunktion | Dokumentation |
| Geräuschpegel | Dokumentation |

Alle optionalen Eigenschaften dürfen vom Framework verwendet werden, sind jedoch für den Grundbetrieb nicht erforderlich.

---

# Kondensatableitung

Der Luftentfeuchter kann auf unterschiedliche Weise betrieben werden.

## Kontinuierlicher Kondensatablauf

Das Kondensat wird dauerhaft über einen Schlauch abgeführt.

Dies ist die empfohlene Betriebsart für einen unbeaufsichtigten Dauerbetrieb.

---

## Tankbetrieb

Das Kondensat wird im internen Wassertank gesammelt.

Der Tank muss regelmäßig geleert werden.

Das Framework soll zukünftig den Tankfüllstand näherungsweise berechnen und den Benutzer rechtzeitig über einen notwendigen Tankwechsel informieren.

Die Schätzung kann unter anderem folgende Informationen berücksichtigen.

- Laufzeit des Luftentfeuchters
- relative Luftfeuchtigkeit
- Raumtemperatur
- Entfeuchtungsbedarf
- Leistungsaufnahme
- Tankvolumen
- maximale Entfeuchtungsleistung

Die Qualität der Schätzung verbessert sich, wenn möglichst viele Geräteeigenschaften bekannt sind.

Die Berechnung dient ausschließlich als Näherung.

Zukünftig kann das Framework zusätzlich historische Betriebsdaten nutzen, um die Schätzung kontinuierlich zu verbessern.

---

## Tankbetrieb mit Füllstandsensor

Optional kann ein Füllstandsensor verwendet werden.

In diesem Fall verwendet das Framework den gemessenen Tankfüllstand anstelle einer berechneten Schätzung.

---

## Gerätekonfiguration

Die Art der Kondensatableitung wird als Geräteeigenschaft konfiguriert.

Mögliche Einstellungen

- Kontinuierlicher Kondensatablauf
- Tankbetrieb
- Tankbetrieb mit Füllstandsensor

---

# Temperatur- und Feuchtesensor

## Anforderungen

Der Sensor sollte mindestens folgende Messwerte bereitstellen.

- Temperatur
- relative Luftfeuchtigkeit

Diese Messwerte bilden die Grundlage der gesamten Regelung.

---

## Platzierung

Der Sensor sollte möglichst repräsentativ für das tatsächliche Raumklima positioniert werden.

Folgende Einflüsse sollten möglichst vermieden werden.

- direkte Sonneneinstrahlung
- Heizkörper
- unmittelbarer Luftstrom des Luftentfeuchters
- Fenster mit häufigem Luftaustausch

---

# Schaltkomponente

## Anforderungen

Die Schaltkomponente muss

- den Luftentfeuchter sicher schalten können
- für die elektrische Leistung geeignet sein

---

## Empfohlene Eigenschaften

Optional werden unterstützt.

- Leistungsmessung
- Energieverbrauchsmessung

Diese Werte dienen der Visualisierung sowie zukünftigen Optimierungen.

---

# Optionale Komponenten

Das Framework kann zukünftig weitere Sensoren und Geräte unterstützen.

Beispiele

- Tankfüllstandsensor
- Außentemperatursensor
- Außen-Feuchtesensor
- zweiter Innen-Feuchtesensor
- Fensterkontakte
- Lüftungsanlage
- Ventilator

Diese Komponenten sind für den Grundbetrieb nicht erforderlich.

---

# Referenzimplementierung

Die aktuelle Referenzimplementierung verwendet folgende Konfiguration.

| Eigenschaft | Referenz |
|-------------|----------|
| Luftentfeuchter | Trotec TTK 171 ECO |
| Dauerbetrieb möglich | Ja |
| Automatischer Wiederanlauf | Ja |
| Art der Kondensatableitung | Kontinuierlicher Kondensatablauf |
| Nennleistung | 900 W |
| Maximale Entfeuchtungsleistung | 52 l / 24 h |
| Tankvolumen | 6 l |
| Sensor | Temperatur- und Feuchtesensor |
| Schaltkomponente | Smarte Steckdose mit Leistungs- und Energiemessung |

Diese Auswahl dient ausschließlich als Referenz.

Das Framework ist nicht an bestimmte Hersteller oder Geräte gebunden.

---

# Entwurfsprinzipien

## Herstellerunabhängig

Alle Komponenten können durch vergleichbare Geräte ersetzt werden.

---

## Modular

Jede Komponente besitzt eine klar definierte Aufgabe.

---

## Erweiterbar

Weitere Sensoren oder Geräte können ergänzt werden, ohne den Controller grundlegend zu verändern.

---

## Fehlertolerant

Optionale Sensoren dürfen den Grundbetrieb nicht beeinträchtigen.

Das Framework muss auch ohne optionale Komponenten vollständig funktionsfähig bleiben.

---

# Zukunft

Geplante Erweiterungen umfassen unter anderem

- mehrere Luftentfeuchter
- Kombination mit Lüftungsanlagen
- Kombination mit Ventilatoren
- Taupunktsensoren
- Tankfüllstandsensoren
- automatische Tankfüllstandsschätzung
- lernfähige Tankfüllstandsberechnung
- automatische Gerätevorschläge anhand bekannter Modelle
- Fenstersteuerung
- energieoptimierte Gerätestrategien

---

# Zusammenfassung

Das Smart Humidity Control Framework benötigt lediglich wenige Pflichtkomponenten.

Durch die konsequente Trennung zwischen Sensorik, Controller, Schaltkomponente und Luftentfeuchter bleibt das Framework herstellerunabhängig und kann zukünftig um weitere Strategien zur Feuchtereduzierung erweitert werden.

Die Unterstützung unterschiedlicher Arten der Kondensatableitung sowie definierter Geräteeigenschaften bildet bereits heute die Grundlage für zukünftige Komfortfunktionen wie Tankfüllstandsschätzung, lernfähige Berechnungen und die Integration von Tankfüllstandsensoren.
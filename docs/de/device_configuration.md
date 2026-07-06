# Gerätekonfiguration

Dieses Dokument beschreibt die Gerätekonfiguration des **Smart Humidity Control Framework**.

Die Gerätekonfiguration beschreibt die technischen Eigenschaften eines unterstützten Geräts und bildet die Grundlage für eine optimale Regelung, Diagnose und zukünftige Erweiterungen.

Die Gerätekonfiguration ist vollständig unabhängig von Herstellern und konkreten Home-Assistant-Entitäten.

---

# Ziel

Die Gerätekonfiguration verfolgt folgende Ziele:

- Beschreibung der technischen Eigenschaften eines Geräts
- Anpassung des Controllers an unterschiedliche Gerätetypen
- Unterstützung zukünftiger Diagnosefunktionen
- Vorbereitung auf verschiedene Luftentfeuchter und zukünftige Strategien zur Feuchtereduzierung

---

# Grundprinzip

Das Smart Humidity Control Framework trennt bewusst zwischen

- Framework
- Controller
- Gerätekonfiguration
- Referenzgerät

Dadurch kann dieselbe Regelungslogik mit unterschiedlichen Geräten verwendet werden.

---

# Referenzgerät

Die Referenzimplementierung basiert derzeit auf folgendem Gerät:

- **Trotec TTK 171 ECO**

Das Framework selbst ist jedoch herstellerunabhängig.

Weitere Luftentfeuchter können durch eine passende Gerätekonfiguration ohne Änderungen am Regelalgorithmus unterstützt werden.

---

# Geräteeigenschaften

Jedes unterstützte Gerät wird durch eine definierte Menge technischer Eigenschaften beschrieben.

| Eigenschaft | Erforderlich | Zweck |
|-------------|:-----------:|-------|
| Nennleistung | ✔ | Leistungsüberwachung |
| Entfeuchtungsleistung | ✔ | Berechnung der geschätzten Tankfüllung |
| Tankvolumen | optional | Tankfüllstandsschätzung |
| Betriebsart Tank / Kondensatablauf | ✔ | Steuerung und Warnmeldungen |
| Automatischer Wiederanlauf | ✔ | Eignung für den Betrieb über ein Schaltgerät |
| Unterstützte Betriebsmodi | optional | Gerätebeschreibung |

Weitere Eigenschaften können zukünftigen Versionen hinzugefügt werden.

---

# Tankbetrieb und Kondensatablauf

Das Framework unterscheidet zwei unterschiedliche Betriebsarten des Luftentfeuchters.

## Tankbetrieb

Das Kondenswasser wird im integrierten Wassertank gesammelt.

Das Framework kann künftig anhand

- Entfeuchtungsleistung
- Tankvolumen
- Laufzeit
- gemessener Luftfeuchtigkeit

eine geschätzte Tankfüllung berechnen.

Der Benutzer wird rechtzeitig über einen vermutlich notwendigen Tankwechsel informiert.

---

## Kontinuierlicher Kondensatablauf

Das Kondenswasser wird dauerhaft über einen Schlauch abgeführt.

In diesem Betriebsmodus erfolgt keine Tankfüllstandsschätzung.

---

# Tankfüllstand

Zukünftige Versionen des Frameworks unterstützen zwei Verfahren.

## Geschätzter Tankfüllstand

Berechnung anhand

- Laufzeit
- Entfeuchtungsleistung
- Tankvolumen
- aktueller Luftfeuchtigkeit

Dieses Verfahren benötigt keine zusätzliche Hardware.

---

## Gemessener Tankfüllstand

Alternativ kann ein Tankfüllstandsensor verwendet werden.

In diesem Fall verwendet das Framework den gemessenen Füllstand anstelle einer Schätzung.

---

# Betrieb über ein Schaltgerät

Das Framework steuert den Luftentfeuchter über ein Schaltgerät.

Hierfür sollte das Gerät nach Wiederkehr der Spannungsversorgung automatisch den vorherigen Betriebszustand wiederherstellen.

Dadurch kann das Framework den Luftentfeuchter zuverlässig über Smart Plugs, Relais oder vergleichbare Schaltgeräte steuern.

---

# Erweiterbarkeit

Die Gerätekonfiguration wurde bewusst offen gestaltet.

Zukünftige Versionen können zusätzliche Eigenschaften ergänzen, beispielsweise

- Luftstrom
- Lüfterstufen
- Geräuschpegel
- Energieeffizienzklasse
- integrierte Hygrostaten
- automatische Abtauung
- Wartungsintervalle
- Filterzustand

ohne Änderungen am Regelalgorithmus.

---

# Zusammenfassung

Die Gerätekonfiguration beschreibt sämtliche technischen Eigenschaften eines unterstützten Geräts.

Sie ermöglicht eine vom Hersteller unabhängige Regelung sowie zukünftige Diagnose-, Wartungs- und Optimierungsfunktionen.

Durch die konsequente Trennung von Framework, Controller und Gerätekonfiguration bleibt die Architektur flexibel und langfristig erweiterbar.
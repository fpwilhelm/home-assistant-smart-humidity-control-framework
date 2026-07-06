# Glossar

Dieses Glossar definiert die im **Smart Humidity Control Framework** verwendeten Fachbegriffe.

Es dient als verbindliche Terminologiereferenz für die gesamte Projektdokumentation, die Home-Assistant-Referenzimplementierung, den Automation Blueprint sowie die zukünftige native Home Assistant Integration.

Alle Dokumente des Projekts verwenden die hier definierten Begriffe.

---

# Verwendung des Glossars

Für jeden Begriff werden folgende Informationen angegeben:

- **Deutscher Begriff**
- **Englischer Begriff**
- **Beschreibung**
- **Hinweise zur Verwendung** (falls erforderlich)

Die englischen Begriffe dienen gleichzeitig als Grundlage für die spätere Implementierung (Blueprint, Integration und Quellcode).

---

# Architektur

## Framework

**Englisch**

Framework

**Beschreibung**

Das Smart Humidity Control Framework umfasst die gesamte Architektur zur intelligenten Regelung der Luftfeuchtigkeit.

Es besteht aus Dokumentation, Referenzimplementierung, Automation Blueprint und der späteren nativen Home Assistant Integration.

---

## Referenzimplementierung

**Englisch**

Reference Implementation

**Beschreibung**

Die aktuelle Home-Assistant-Implementierung des Frameworks.

Sie dient als Grundlage für Entwicklung, Tests und Dokumentation.

---

## Referenzgerät

**Englisch**

Reference Device

**Beschreibung**

Das Gerät, auf dessen Basis die Referenzimplementierung entwickelt wurde.

Aktuell:

- Trotec TTK 171 ECO

Das Framework selbst bleibt herstellerunabhängig.

---

# Regelung

## Ziel-Luftfeuchtigkeit

**Englisch**

Target Humidity

**Beschreibung**

Gewünschte relative Luftfeuchtigkeit, auf welche der Controller den Raum regelt.

**Hinweis**

Im gesamten Framework bezeichnet „Luftfeuchtigkeit“ grundsätzlich die **relative Luftfeuchtigkeit**, sofern nicht ausdrücklich anders angegeben.

---

## Relative Luftfeuchtigkeit

**Englisch**

Relative Humidity

**Beschreibung**

Anteil des aktuell enthaltenen Wasserdampfes an der maximal möglichen Wasserdampfmenge der Luft bei gleicher Temperatur.

Einheit:

```text
%
```

---

## Absolute Luftfeuchtigkeit

**Englisch**

Absolute Humidity

**Beschreibung**

Tatsächlich in der Luft enthaltene Wassermenge.

Sie wird derzeit nicht direkt vom Framework verwendet, kann jedoch künftig für erweiterte Regelstrategien berücksichtigt werden.

Einheit:

```text
g/m³
```

---

## Feuchteprofil

**Englisch**

Humidity Profile

**Beschreibung**

Ein Feuchteprofil definiert die empfohlene Ziel-Luftfeuchtigkeit für einen typischen Anwendungsfall.

Beispiele:

- Wohnraum
- Schlafzimmer
- Badezimmer
- Waschküche
- Keller unbeheizt

---

## Regelcharakteristik

**Englisch**

Control Characteristic

**Beschreibung**

Die Regelcharakteristik beschreibt, wie eng oder großzügig der Controller um die Ziel-Luftfeuchtigkeit regelt.

Sie beeinflusst insbesondere die verwendete Hysterese.

Aktuelle Regelcharakteristiken:

- Streng
- Standard
- Großzügig

---

## Zielwertmodus

**Englisch**

Target Mode

**Beschreibung**

Legt fest, wie die Ziel-Luftfeuchtigkeit bestimmt wird.

Aktuelle Modi:

- Feuchteprofil
- Benutzerdefiniert

---

## Hysterese

**Englisch**

Hysteresis

**Beschreibung**

Abstand zwischen Ziel-Luftfeuchtigkeit und Einschaltgrenze.

Sie verhindert häufiges Ein- und Ausschalten des Luftentfeuchters.

---

## Einschaltgrenze

**Englisch**

Activation Threshold

**Beschreibung**

Luftfeuchtigkeit, bei deren Überschreiten der Controller den Luftentfeuchter im Automatikbetrieb einschaltet.

---

## Zielbereich

**Englisch**

Target Range

**Beschreibung**

Bereich zwischen Ziel-Luftfeuchtigkeit und Einschaltgrenze.

Der Zielbereich wird im Dashboard visualisiert.

---

# Betriebsarten

## Betriebsmodus

**Englisch**

Operating Mode

**Beschreibung**

Grundsätzliche Betriebsart des Controllers.

Aktuelle Betriebsmodi:

- Aus
- Automatik
- Dauerbetrieb
- Zeitbetrieb

---

## Betriebsstatus

**Englisch**

Operating Status

**Beschreibung**

Vom Controller berechneter aktueller logischer Zustand.

Der Betriebsstatus dient ausschließlich der Anzeige und Diagnose.

---

# Geräte

## Luftentfeuchter

**Englisch**

Dehumidifier

**Beschreibung**

Referenzgerät des Frameworks.

Langfristig können weitere Strategien zur Reduzierung der Luftfeuchtigkeit unterstützt werden.

---

## Schaltgerät

**Englisch**

Switching Device

**Beschreibung**

Komponente, mit der das Framework ein Gerät ein- oder ausschaltet.

Beispiele:

- Smart Plug
- Relais
- Shelly
- Schütz

---

## Gerätekonfiguration

**Englisch**

Device Configuration

**Beschreibung**

Konfiguration der Eigenschaften eines unterstützten Geräts.

Beispiele:

- Nennleistung
- Entfeuchtungsleistung
- Tankvolumen
- Kondensatbetrieb

---

# Sensorik

## Template-Sensor

**Englisch**

Template Sensor

**Beschreibung**

Berechneter Sensor innerhalb der Referenzimplementierung.

Template-Sensoren enthalten ausschließlich berechnete Werte und bilden die Datengrundlage für Controller und Dashboard.

---

## Helfer

**Englisch**

Helper

**Beschreibung**

Vom Benutzer konfigurierbare Home-Assistant-Entitäten.

Sie enthalten keine Regelungslogik.

---

# Bauphysik

## Taupunkt

**Englisch**

Dew Point

**Beschreibung**

Temperatur, bei der Wasserdampf aus der Luft zu kondensieren beginnt.

Der Taupunkt bildet die Grundlage zukünftiger bauphysikalischer Bewertungen.

---

## Schimmelrisiko

**Englisch**

Mold Risk

**Beschreibung**

Bewertung des Risikos von Schimmelbildung anhand verschiedener Klimadaten.

Diese Funktion ist für zukünftige Versionen vorgesehen.

---

# Entwicklungsstufen

## Automation Blueprint

**Englisch**

Automation Blueprint

**Beschreibung**

Generische Home-Assistant-Automation zur Wiederverwendung des Frameworks.

---

## Native Home Assistant Integration

**Englisch**

Native Home Assistant Integration

**Beschreibung**

Zukünftige vollständige Integration des Frameworks in Home Assistant.

---

# Terminologie

Für das gesamte Projekt gelten folgende bevorzugte Begriffe.

| Deutsch | Englisch |
|----------|-----------|
| Ziel-Luftfeuchtigkeit | Target Humidity |
| Relative Luftfeuchtigkeit | Relative Humidity |
| Feuchteprofil | Humidity Profile |
| Regelcharakteristik | Control Characteristic |
| Betriebsmodus | Operating Mode |
| Betriebsstatus | Operating Status |
| Hysterese | Hysteresis |
| Einschaltgrenze | Activation Threshold |
| Zielbereich | Target Range |
| Luftentfeuchter | Dehumidifier |
| Schaltgerät | Switching Device |
| Gerätekonfiguration | Device Configuration |
| Template-Sensor | Template Sensor |
| Helfer | Helper |

---

# Grundsatz

Dieses Glossar ist die verbindliche Referenz für sämtliche Begriffe des Smart Humidity Control Framework.

Neue Begriffe sollen ausschließlich hier eingeführt und anschließend in der gesamten Dokumentation konsistent verwendet werden.
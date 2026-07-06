# Template-Sensoren

## Zweck

Dieses Dokument beschreibt alle Template-Sensoren der aktuellen Referenzimplementierung des Smart Humidity Control Frameworks.

Die Template-Sensoren bilden die Berechnungsschicht der Referenzimplementierung. Sie stellen sämtliche berechneten Werte bereit, auf denen Controller, Dashboard sowie zukünftige Blueprint- und Integrationslogik aufbauen.

Das Framework regelt die **Luftfeuchtigkeit** als Zielgröße. Das Regelobjekt ist das **Raumklima**. In der aktuellen Referenzimplementierung ist der **Luftentfeuchter** das gesteuerte Referenzgerät.

---

# Hinweis zur Referenzimplementierung

Die in diesem Dokument genannten Entity-IDs stammen aus der aktuellen Referenzimplementierung mit einem **Trotec TTK 171 ECO**.

Sie dienen ausschließlich als Beispiele und werden in zukünftigen Blueprint-Versionen sowie in der nativen Home-Assistant-Integration durch generische Eingaben oder interne Entitäten ersetzt.

---

# Zielwerte

## Ziel-Luftfeuchtigkeit

**Entity**

```text
sensor.trotec_ttk_171_eco_ziel_luftfeuchtigkeit
```

**Zweck**

Berechnet den aktuell gültigen Zielwert der relativen Luftfeuchtigkeit.

**Abhängigkeiten**

- Zielwertmodus
- Feuchteprofil
- Regelcharakteristik
- Benutzerdefinierter Zielwert

**Logik**

Wenn der Zielwertmodus **Benutzerdefiniert** ist, wird der benutzerdefinierte Zielwert verwendet.

Andernfalls ergibt sich der Zielwert aus

```text
Basiswert des Feuchteprofils + Korrektur durch Regelcharakteristik
```

**Verwendung**

- Controller
- Dashboard
- Zielbereich
- Einschaltgrenze
- Sollwertabweichung
- Ziel-Taupunkt

---

## Hysterese

**Entity**

```text
sensor.trotec_ttk_171_eco_hysterese
```

**Zweck**

Definiert den Abstand zwischen Zielwert und Einschaltgrenze.

**Abhängigkeiten**

- Regelcharakteristik

**Aktuelle Werte**

| Regelcharakteristik | Hysterese |
|--------------|----------:|
| Komfort | 3 % |
| Standard | 5 % |
| Konservativ | 7 % |

**Verwendung**

- Einschaltgrenze
- Controller

---

## Einschaltgrenze

**Entity**

```text
sensor.trotec_ttk_171_eco_einschaltgrenze
```

**Zweck**

Definiert den Feuchtewert, ab dem der Controller im Automatikbetrieb den Luftentfeuchter einschaltet.

**Formel**

```text
Einschaltgrenze = Ziel-Luftfeuchtigkeit + Hysterese
```

**Verwendung**

- Controller
- Dashboard
- Betriebsstatus
- Zielbereich Obergrenze

---

# Zielbereich

Der Zielbereich dient derzeit ausschließlich der Visualisierung im Dashboard.

Er beschreibt den Bereich zwischen Ziel-Luftfeuchtigkeit und Einschaltgrenze und besitzt aktuell keine eigenständige regelungstechnische Bedeutung.

## Zielbereich Untergrenze

**Entity**

```text
sensor.trotec_ttk_171_eco_zielbereich_untergrenze
```

**Zweck**

Definiert die untere Grenze des Zielbereichs.

**Logik**

```text
Zielbereich Untergrenze = Ziel-Luftfeuchtigkeit
```

**Verwendung**

- Dashboard
- Gauge Card Pro

---

## Zielbereich Obergrenze

**Entity**

```text
sensor.trotec_ttk_171_eco_zielbereich_obergrenze
```

**Zweck**

Definiert die obere Grenze des Zielbereichs.

**Logik**

```text
Zielbereich Obergrenze = Einschaltgrenze
```

**Verwendung**

- Dashboard
- Gauge Card Pro

---

# Taupunkt

Die Taupunktwerte erweitern die Bewertung des Raumklimas.

Sie sind für die aktuelle Regelung nicht erforderlich, bilden jedoch die Grundlage zukünftiger bauphysikalischer Auswertungen.

## Taupunkt innen

**Entity**

```text
sensor.trotec_ttk_171_eco_taupunkt_innen
```

**Status**

Optional / geplant

**Zweck**

Berechnet den aktuellen Taupunkt der Innenluft aus Temperatur und relativer Luftfeuchtigkeit.

**Abhängigkeiten**

- Innentemperatur
- Innenluftfeuchtigkeit

**Verwendung**

- Dashboard
- Bauphysikalische Bewertung
- Kondensationsbewertung
- Schimmelrisikobewertung

---

## Ziel-Taupunkt

**Entity**

```text
sensor.trotec_ttk_171_eco_ziel_taupunkt
```

**Status**

Optional / geplant

**Zweck**

Berechnet den Taupunkt, der sich bei aktueller Raumtemperatur und Ziel-Luftfeuchtigkeit ergibt.

**Abhängigkeiten**

- Innentemperatur
- Ziel-Luftfeuchtigkeit

**Unterschied**

- **Taupunkt innen** beschreibt den aktuellen Zustand.
- **Ziel-Taupunkt** beschreibt den angestrebten Zustand.

**Verwendung**

- Bauphysikalische Bewertung
- Vergleich zwischen aktuellem und angestrebtem Feuchtezustand

---

# Bewertung

## Sollwertabweichung

**Entity**

```text
sensor.trotec_ttk_171_eco_sollwertabweichung
```

**Zweck**

Berechnet die Differenz zwischen Ist-Luftfeuchtigkeit und Ziel-Luftfeuchtigkeit.

**Formel**

```text
Sollwertabweichung = Ist-Luftfeuchtigkeit − Ziel-Luftfeuchtigkeit
```

**Interpretation**

| Wert | Bedeutung |
|------:|-----------|
| kleiner 0 | trockener als Zielwert |
| 0 | Zielwert erreicht |
| größer 0 | feuchter als Zielwert |

**Verwendung**

- Dashboard
- Diagramme
- Statistiken

---

## Entfeuchtungsbedarf

**Entity**

```text
sensor.trotec_ttk_171_eco_entfeuchtungsbedarf
```

**Zweck**

Bewertet die Sollwertabweichung als leicht verständlichen Status.

**Abhängigkeiten**

- Ist-Luftfeuchtigkeit
- Ziel-Luftfeuchtigkeit

**Aktuelle Klassifizierung**

| Abweichung | Status |
|-----------:|--------|
| ≤ 0 % | Kein Bedarf |
| > 0 bis 2 % | Gering |
| > 2 bis 5 % | Mittel |
| > 5 bis 10 % | Hoch |
| > 10 % | Sehr hoch |

**Verwendung**

- Dashboard
- Spätere Automationen
- Spätere Optimierungen

**Hinweis**

Der Entfeuchtungsbedarf dient derzeit ausschließlich der Bewertung und Visualisierung.

Er beeinflusst aktuell keine Steuerungsentscheidung des Controllers.

---

# Betriebsstatus

## Betriebsstatus

**Entity**

```text
sensor.trotec_ttk_171_eco_betriebsstatus
```

**Zweck**

Berechnet den aktuellen logischen Zustand des Controllers.

**Mögliche Zustände**

- Aus
- Dauerbetrieb
- Zeitbetrieb aktiv
- Zeitbetrieb beendet
- Automatik – Entfeuchtet
- Automatik – Läuft nach
- Automatik – Ziel erreicht
- Automatik – Wartet
- Sensorfehler
- Unbekannter Zustand

**Verwendung**

- Controller
- Dashboard
- Diagnose

---

## Betriebsstatus-Anzeige

**Entity**

```text
sensor.trotec_ttk_171_eco_betriebsstatus_anzeige
```

**Zweck**

Erzeugt eine benutzerfreundliche Darstellung des Betriebsstatus.

**Beispiele**

```text
💧 Automatik – Entfeuchtet
✅ Automatik – Ziel erreicht
⏱️ Zeitbetrieb aktiv
⏻ Aus
```

**Verwendung**

- Dashboard
- Benutzeroberfläche

**Hinweis**

Diese Entität dient ausschließlich der Darstellung.

Der Controller verwendet ausschließlich den eigentlichen Betriebsstatus.

---

# Architekturhinweis

Die Template-Sensoren bilden die Berechnungsschicht zwischen Konfiguration, physikalischen Sensoren und Controller.

```text
Benutzer
      │
      ▼
Helper-Entitäten
      │
      ▼
Physische Sensoren
      │
      ▼
Template-Sensoren
      │
      ▼
Controller
      │
      ▼
Luftentfeuchter
```

Diese Trennung sorgt dafür, dass sämtliche Berechnungen zentral erfolgen, während der Controller ausschließlich Entscheidungen trifft.

---

# Entwurfsprinzipien

## Zentrale Berechnung

Jeder berechnete Wert wird genau einmal erzeugt und anschließend von allen Komponenten verwendet.

## Wiederverwendbarkeit

Template-Sensoren können gleichzeitig vom Controller, Dashboard und zukünftigen Automationen genutzt werden.

## Nachvollziehbarkeit

Alle Berechnungen sind transparent und unabhängig vom Controller überprüfbar.

## Trennung von Berechnung und Steuerung

Die Template-Sensoren berechnen Werte.

Der Controller trifft Entscheidungen.

Der Luftentfeuchter setzt die Schaltentscheidung um.

---

# Zukunft

Die aktuelle Referenzimplementierung verwendet Home-Assistant-Template-Sensoren.

In einer späteren nativen Integration können dieselben fachlichen Werte intern berechnet und anschließend als Sensor-Entitäten bereitgestellt werden.

Zukünftige Erweiterungen können weitere Strategien zur Feuchtereduzierung ergänzen, ohne die grundlegende Berechnungsschicht zu verändern.

---

# Zusammenfassung

Die Template-Sensoren bilden die Berechnungsschicht der aktuellen Referenzimplementierung des Smart Humidity Control Frameworks.

Sie stellen sämtliche berechneten Werte zentral bereit und trennen Berechnungen konsequent von Steuerungslogik, Benutzeroberfläche und Geräteansteuerung.

---

# Taupunkt

Die Taupunktwerte erweitern die Bewertung des Raumklimas.

Sie sind für die aktuelle Regelung nicht erforderlich, bilden jedoch die Grundlage zukünftiger bauphysikalischer Auswertungen.

## Taupunkt innen

**Entity**

```text
sensor.trotec_ttk_171_eco_taupunkt_innen
```

**Status**

Optional / geplant

**Zweck**

Berechnet den aktuellen Taupunkt der Innenluft aus Temperatur und relativer Luftfeuchtigkeit.

**Abhängigkeiten**

- Innentemperatur
- Innenluftfeuchtigkeit

**Verwendung**

- Dashboard
- Bauphysikalische Bewertung
- Kondensationsbewertung
- Schimmelrisikobewertung

---

## Ziel-Taupunkt

**Entity**

```text
sensor.trotec_ttk_171_eco_ziel_taupunkt
```

**Status**

Optional / geplant

**Zweck**

Berechnet den Taupunkt, der sich bei aktueller Raumtemperatur und Ziel-Luftfeuchtigkeit ergibt.

**Abhängigkeiten**

- Innentemperatur
- Ziel-Luftfeuchtigkeit

**Unterschied**

- **Taupunkt innen** beschreibt den aktuellen Zustand.
- **Ziel-Taupunkt** beschreibt den angestrebten Zustand.

**Verwendung**

- Bauphysikalische Bewertung
- Vergleich zwischen aktuellem und angestrebtem Feuchtezustand

---

# Bewertung

## Sollwertabweichung

**Entity**

```text
sensor.trotec_ttk_171_eco_sollwertabweichung
```

**Zweck**

Berechnet die Differenz zwischen Ist-Luftfeuchtigkeit und Ziel-Luftfeuchtigkeit.

Die Sollwertabweichung gehört zu den wichtigsten berechneten Framework-Werten. Sie beschreibt den aktuellen Abstand zwischen Soll- und Ist-Zustand und dient sowohl der Diagnose als auch als Grundlage zukünftiger Regelstrategien und Optimierungen.

**Formel**

```text
Sollwertabweichung = Ist-Luftfeuchtigkeit − Ziel-Luftfeuchtigkeit
```

**Interpretation**

| Wert | Bedeutung |
|------:|-----------|
| kleiner 0 | trockener als Zielwert |
| 0 | Zielwert erreicht |
| größer 0 | feuchter als Zielwert |

**Verwendung**

- Dashboard
- Diagramme
- Statistiken

---

## Entfeuchtungsbedarf

**Entity**

```text
sensor.trotec_ttk_171_eco_entfeuchtungsbedarf
```

**Zweck**

Bewertet die Sollwertabweichung als leicht verständlichen Status.

**Abhängigkeiten**

- Ist-Luftfeuchtigkeit
- Ziel-Luftfeuchtigkeit

**Aktuelle Klassifizierung**

| Abweichung | Status |
|-----------:|--------|
| ≤ 0 % | Kein Bedarf |
| > 0 bis 2 % | Gering |
| > 2 bis 5 % | Mittel |
| > 5 bis 10 % | Hoch |
| > 10 % | Sehr hoch |

**Verwendung**

- Dashboard
- Spätere Automationen
- Spätere Optimierungen

**Hinweis**

Der Entfeuchtungsbedarf dient derzeit ausschließlich der Bewertung und Visualisierung.

Er beeinflusst aktuell keine Steuerungsentscheidung des Controllers.

---

# Betriebsstatus

## Betriebsstatus

**Entity**

```text
sensor.trotec_ttk_171_eco_betriebsstatus
```

**Zweck**

Berechnet den aktuellen logischen Zustand des Controllers.

Der Betriebsstatus beschreibt ausschließlich die Entscheidung des Controllers.

Er stellt weder den tatsächlichen Schaltzustand des Schaltgeräts noch den aktuellen Betriebszustand des Luftentfeuchters dar.

**Mögliche Zustände**

- Aus
- Dauerbetrieb
- Zeitbetrieb aktiv
- Zeitbetrieb beendet
- Automatik – Entfeuchtet
- Automatik – Läuft nach
- Automatik – Ziel erreicht
- Automatik – Wartet
- Sensorfehler
- Unbekannter Zustand

**Verwendung**

- Controller
- Dashboard
- Diagnose

---

## Betriebsstatus-Anzeige

**Entity**

```text
sensor.trotec_ttk_171_eco_betriebsstatus_anzeige
```

**Zweck**

Erzeugt eine benutzerfreundliche Darstellung des Betriebsstatus.

**Beispiele**

```text
💧 Automatik – Entfeuchtet
✅ Automatik – Ziel erreicht
⏱️ Zeitbetrieb aktiv
⏻ Aus
```

**Verwendung**

- Dashboard
- Benutzeroberfläche

**Hinweis**

Diese Entität dient ausschließlich der Darstellung.

Der Controller verwendet ausschließlich den eigentlichen Betriebsstatus.

---

# Architekturhinweis

Die Template-Sensoren bilden die Berechnungsschicht zwischen Konfiguration, physikalischen Sensoren und Controller.

```text
Benutzer
      │
      ▼
Helper-Entitäten
      │
      ▼
Physische Sensoren
      │
      ▼
Template-Sensoren
      │
      ▼
Controller
      │
      ▼
Schaltgerät
      │
      ▼
Luftentfeuchter
```

Diese Trennung sorgt dafür, dass sämtliche Berechnungen zentral erfolgen, während der Controller ausschließlich Entscheidungen trifft.

---

# Entwurfsprinzipien

## Zentrale Berechnung

Jeder berechnete Wert wird genau einmal erzeugt und anschließend von allen Komponenten verwendet.

Dadurch entstehen keine unterschiedlichen Berechnungen desselben fachlichen Wertes.

---

## Wiederverwendbarkeit

Template-Sensoren können gleichzeitig vom Controller, Dashboard und zukünftigen Automationen genutzt werden.

Dadurch bleibt die Referenzimplementierung modular aufgebaut.

---

## Nachvollziehbarkeit

Alle Berechnungen sind transparent und unabhängig vom Controller überprüfbar.

Dies erleichtert sowohl die Fehlersuche als auch die Weiterentwicklung des Frameworks.

---

## Trennung von Berechnung und Steuerung

Die Template-Sensoren berechnen Werte.

Der Controller trifft Entscheidungen.

Das Schaltgerät setzt die Entscheidung des Controllers um.

Der Luftentfeuchter verändert anschließend das Raumklima.

Diese konsequente Aufgabentrennung bildet einen der grundlegenden Architekturbausteine des Smart Humidity Control Framework.

---

# Zukunft

Die aktuelle Referenzimplementierung verwendet Home-Assistant-Template-Sensoren.

In einer späteren nativen Home Assistant Integration können dieselben fachlichen Werte intern berechnet und anschließend als Sensor-Entitäten bereitgestellt werden.

Dadurch bleibt das fachliche Modell des Frameworks unverändert, während sich lediglich die technische Umsetzung ändert.

---

# Geplante Template-Sensoren

Zukünftige Versionen des Frameworks können zusätzliche berechnete Werte bereitstellen.

Beispiele:

- geschätzter Tankfüllstand
- Tankfüllstandwarnung
- Taupunktdifferenz
- Kondensationsrisiko
- Schimmelrisiko
- Energieeffizienzbewertung
- Entfeuchtungsleistung
- Wartungsstatus

Diese Sensoren gehören nicht zur aktuellen Referenzimplementierung, sind jedoch bereits Bestandteil der langfristigen Framework-Architektur.

---

# Zusammenfassung

Die Template-Sensoren bilden die Berechnungsschicht der aktuellen Referenzimplementierung des Smart Humidity Control Frameworks.

Sie stellen sämtliche berechneten Framework-Werte zentral bereit und trennen Berechnungen konsequent von Steuerungslogik, Benutzeroberfläche und Geräteansteuerung.

Diese Architektur ermöglicht eine transparente, nachvollziehbare und wiederverwendbare Regelungslogik und bildet gleichzeitig die Grundlage für den Automation Blueprint sowie die zukünftige native Home Assistant Integration.
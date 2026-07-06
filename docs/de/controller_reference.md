# Controller-Referenz

## Zweck

Der Controller ist das zentrale Steuermodul des Smart Humidity Control Frameworks.

Er überwacht kontinuierlich die verfügbaren Sensordaten, berechnet den gewünschten Betriebszustand und entscheidet, ob der Luftentfeuchter ein- oder ausgeschaltet werden soll.

Der Controller selbst enthält ausschließlich Steuerungslogik.

Die Kommunikation mit Home Assistant erfolgt über die Integrationsschicht bzw. den Blueprint.

---

# Verantwortlichkeiten

Der Controller ist verantwortlich für

- Auswertung der Sensordaten
- Berechnung des Zielwerts
- Anwendung der Hysterese
- Steuerung des Luftentfeuchters
- Verwaltung der Betriebsmodi
- Verwaltung des Betriebsstatus
- Einhaltung von Mindestlaufzeiten
- Einhaltung von Mindestpausen
- Sicherheitsfunktionen
- Bereitstellung von Diagnoseinformationen

Nicht verantwortlich ist der Controller für

- Dashboard-Darstellung
- Benutzeroberfläche
- Geräteerkennung
- Home-Assistant-Konfiguration

---

# Betriebsmodi

Der Betriebsmodus bestimmt das grundsätzliche Verhalten des Controllers.

## Automatik

Standardmodus.

Der Controller regelt den Luftentfeuchter selbstständig anhand der aktuellen Luftfeuchtigkeit und der aktiven Konfiguration.

---

## Zeitbetrieb

Der Luftentfeuchter wird unabhängig von der gemessenen Luftfeuchtigkeit für eine definierte Zeit eingeschaltet.

Nach Ablauf der Zeit wechselt der Controller automatisch zurück in den Betriebsmodus Automatik.

---

## Aus *(geplant)*

Der Controller bleibt aktiv, schaltet den Luftentfeuchter jedoch grundsätzlich nicht ein.

Alle Sensorwerte und Diagnoseinformationen werden weiterhin aktualisiert.

---

## Manuell *(zukünftig)*

Der Benutzer entscheidet selbst über den Schaltzustand.

Der Controller überwacht weiterhin alle Werte, greift jedoch nicht automatisch ein.

---

## Wartung *(zukünftig)*

Für Service- und Testzwecke.

Automatische Steuerungsentscheidungen werden ausgesetzt.

---

# Betriebsstatus

Während der Controller arbeitet, befindet er sich jederzeit in genau einem Betriebsstatus.

Der Betriebsstatus beschreibt den aktuellen Zustand des Reglers.

## Initialisierung

Der Controller startet oder initialisiert seine Daten.

---

## Entfeuchtet

Der Luftentfeuchter ist eingeschaltet.

---

## Zielbereich erreicht

Die Luftfeuchtigkeit befindet sich innerhalb des gewünschten Bereichs.

Keine Schaltung erforderlich.

---

## Wartet auf Hysterese

Die Luftfeuchtigkeit befindet sich außerhalb des Zielwerts, erfüllt jedoch noch nicht die Hysterese für eine Schaltung.

---

## Mindestlaufzeit aktiv

Der Luftentfeuchter bleibt eingeschaltet, obwohl der Zielwert bereits erreicht wurde.

---

## Mindestpause aktiv

Der Luftentfeuchter bleibt ausgeschaltet, obwohl die Einschaltbedingungen bereits erfüllt wären.

---

## Zeitbetrieb aktiv

Der Luftentfeuchter läuft aufgrund eines aktiven Zeitbetriebs.

---

## Controller deaktiviert

Die automatische Steuerung wurde deaktiviert.

---

## Sensorfehler

Mindestens ein erforderlicher Sensor liefert keine gültigen Werte.

Aus Sicherheitsgründen erfolgt keine automatische Steuerung.

---

## Fehler

Interner Fehler des Controllers.

---

# Prioritäten

Falls mehrere Zustände gleichzeitig auftreten können, gelten folgende Prioritäten.

| Priorität | Zustand |
|-----------:|---------|
| 1 | Fehler |
| 2 | Sensorfehler |
| 3 | Wartung |
| 4 | Controller deaktiviert |
| 5 | Zeitbetrieb |
| 6 | Mindestlaufzeit |
| 7 | Mindestpause |
| 8 | Automatik |

Dadurch ist jederzeit eindeutig definiert, welcher Zustand Vorrang besitzt.

---

# Zustandsübergänge

Der Controller reagiert auf Ereignisse.

Typische Zustandswechsel sind

```text
Initialisierung
        │
        ▼
Automatik
        │
        ▼
Feuchtigkeit oberhalb Einschaltgrenze
        │
        ▼
Entfeuchtet
        │
        ▼
Zielwert erreicht
        │
        ▼
Mindestlaufzeit
        │
        ▼
Wartet auf Hysterese
        │
        ▼
Automatik
```

Zeitbetrieb besitzt eine höhere Priorität.

```text
Automatik
      │
      ▼
Zeitbetrieb gestartet
      │
      ▼
Zeitbetrieb aktiv
      │
      ▼
Zeit abgelaufen
      │
      ▼
Automatik
```

---

# Ereignisse

Folgende Ereignisse können eine Neubewertung des Controllers auslösen.

- Änderung der Luftfeuchtigkeit
- Änderung der Temperatur
- Änderung eines Raumprofils
- Änderung des Schutzniveaus
- Änderung eines Sollwerts
- Änderung der Hysterese
- Start des Zeitbetriebs
- Ende des Zeitbetriebs
- Controller aktiviert
- Controller deaktiviert
- Neustart von Home Assistant
- Sensorfehler
- Wiederherstellung eines Sensors

---

# Steuerungszyklus

Jede Bewertung des Controllers folgt derselben Reihenfolge.

1. Sensordaten einlesen
2. Werte prüfen
3. Zielwert bestimmen
4. Betriebsmodus auswerten
5. Sicherheitsfunktionen prüfen
6. Hysterese anwenden
7. Schaltentscheidung treffen
8. Betriebsstatus aktualisieren
9. Diagnoseinformationen aktualisieren

---

# Sicherheitsfunktionen

Der Controller schützt den Luftentfeuchter vor unnötigen Schaltvorgängen.

Hierzu gehören unter anderem

- Mindestlaufzeit
- Mindestpause
- Hysterese
- Sensorprüfung
- Fehlererkennung

---

# Diagnose

Der Controller stellt Diagnoseinformationen bereit.

Hierzu gehören beispielsweise

- aktueller Betriebsmodus
- aktueller Betriebsstatus
- letzter Schaltgrund
- letzte Schaltung
- aktive Hysterese
- aktueller Zielwert
- aktuelle Regelentscheidung

Diese Informationen dienen der Nachvollziehbarkeit und Fehlersuche.

---

# Erweiterbarkeit

Der Controller ist modular aufgebaut.

Zukünftige Erweiterungen können integriert werden, ohne bestehende Funktionen zu verändern.

Geplante Erweiterungen

- Taupunktregelung
- Außentemperatur
- Wettervorhersage
- Fensterkontakte
- Lüftungssteuerung
- Energieoptimierung
- KI-gestützte Sollwertanpassung

---

# Zusammenfassung

Der Controller bildet den funktionalen Kern des Smart Humidity Control Frameworks.

Er definiert das vollständige Regelverhalten unabhängig von der konkreten Implementierung als Blueprint oder Home Assistant Integration.

Dadurch bleibt die Steuerungslogik klar definiert, nachvollziehbar und langfristig wartbar.
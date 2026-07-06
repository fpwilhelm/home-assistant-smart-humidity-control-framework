# Feuchteprofile

## Zweck

Dieses Dokument beschreibt das Profilsystem des Smart Humidity Control Framework.

Feuchteprofile definieren empfohlene Zielwerte der **relativen Luftfeuchtigkeit** für typische Nutzungsarten von Räumen.

Sie bilden die fachliche Grundlage für die automatische Berechnung der Ziel-Luftfeuchtigkeit und stellen das im Framework hinterlegte Fachwissen bereit.

---

# Ziel

Das Profilsystem verfolgt folgende Ziele.

- Einfache Konfiguration
- Nachvollziehbare Zielwerte
- Bewährte Standardwerte
- Flexible Anpassbarkeit
- Unterstützung benutzerdefinierter Profile
- Klare Trennung zwischen Raumklima und Regelstrategie

---

# Grundprinzip

Ein Feuchteprofil beschreibt den langfristig gewünschten Zustand des Raumklimas.

Es definiert einen empfohlenen Basiswert der **relativen Luftfeuchtigkeit**.

Die eigentliche Regelung erfolgt anschließend durch die gewählte Regelcharakteristik.

```text
Feuchteprofil
        │
        ▼
Basiswert
        │
        ▼
Regelcharakteristik
        │
        ▼
Regelverhalten
```

---

# Standardprofile

Die Referenzimplementierung enthält folgende Standardprofile.

Jedes Feuchteprofil definiert

- einen empfohlenen Basiswert der relativen Luftfeuchtigkeit und
- eine empfohlene Regelcharakteristik.

Die Regelcharakteristik dient als Empfehlung und kann vom Benutzer jederzeit geändert werden.

| Feuchteprofil | Basiswert | Empfohlene Regelcharakteristik |
|---------------|----------:|-------------------------------|
| Wohnraum | 50 % | Standard |
| Schlafzimmer | 50 % | Großzügig |
| Badezimmer | 55 % | Standard |
| Innenliegendes Bad | 50 % | Streng |
| Arbeitsraum | 50 % | Standard |
| Technikraum | 50 % | Streng |
| Lagerraum | 50 % | Standard |
| Keller beheizt | 55 % | Standard |
| Keller unbeheizt | 60 % | Streng |
| Garage | 60 % | Großzügig |
| Hauswirtschaftsraum | 55 % | Streng |

Die angegebenen Werte stellen empfohlene Ausgangswerte dar und können zukünftig angepasst werden.

---

# Beschreibung der Standardprofile

## Wohnraum

Für Wohn-, Ess- und Hobbyräume mit dauerhaftem Aufenthalt.

---

## Schlafzimmer

Für Schlafräume mit dauerhaftem Aufenthalt.

---

## Badezimmer

Für regelmäßig gelüftete Badezimmer mit Fenster.

---

## Innenliegendes Bad

Für Badezimmer ohne Fenster oder mit eingeschränkter natürlicher Lüftung.

---

## Arbeitsraum

Für Büros, Arbeitszimmer, Hobbyräume oder Werkstätten.

---

## Technikraum

Für Räume mit technischer Gebäudeausrüstung.

---

## Lagerraum

Für Archiv-, Vorrats- und Lagerräume.

---

## Keller beheizt

Für beheizte Kellerräume mit regelmäßiger Nutzung.

---

## Keller unbeheizt

Für unbeheizte Kellerräume mit erhöhter Feuchtebelastung.

---

## Garage

Für Garagen und vergleichbare unbeheizte Nebenräume.

---

## Hauswirtschaftsraum

Für Räume mit Waschmaschine, Trockner, Wäscheständern oder vergleichbarer Nutzung.

---

# Regelcharakteristik

Die Regelcharakteristik beschreibt, wie präzise der Controller den gewünschten Zielwert der relativen Luftfeuchtigkeit einhält.

Sie beeinflusst insbesondere die verwendete Hysterese.

Die Regelcharakteristik ist unabhängig vom gewählten Feuchteprofil.

Jedes Standardprofil besitzt eine empfohlene Regelcharakteristik.

Diese wird beim Auswählen eines Feuchteprofils automatisch vorgeschlagen.

Der Benutzer kann die Regelcharakteristik jederzeit unabhängig vom Feuchteprofil ändern.

## Streng

**Code**

```text
strict
```

Eine enge Regelung mit kleiner Hysterese.

Geeignet für empfindliche Anwendungen oder Räume mit erhöhten Anforderungen an eine konstante Luftfeuchtigkeit.

---

## Standard

**Code**

```text
standard
```

Ausgewogene Regelung für die meisten Anwendungen.

Dies ist die empfohlene Voreinstellung.

---

## Großzügig

**Code**

```text
flexible
```

Größere Hysterese mit weniger Schaltvorgängen.

Geeignet für Räume mit geringeren Anforderungen an eine konstante Luftfeuchtigkeit.

---

# Benutzerdefinierte Profile

Neben den Standardprofilen sollen Benutzer zukünftig beliebige eigene Feuchteprofile erstellen können.

Ein benutzerdefiniertes Profil besitzt mindestens

- Profilname
- Basiswert
- empfohlene Regelcharakteristik
- Beschreibung (optional)

Dadurch kann das Framework flexibel an individuelle Anforderungen angepasst werden.

---

# Ziel-Luftfeuchtigkeit

Die Ziel-Luftfeuchtigkeit ergibt sich grundsätzlich aus dem gewählten Feuchteprofil.

Die Regelcharakteristik beeinflusst anschließend die Art der Regelung, insbesondere die verwendete Hysterese.

```text
Feuchteprofil
        │
        ▼
Ziel-Luftfeuchtigkeit

Regelcharakteristik
        │
        ▼
Regelverhalten
```

Alternativ kann der Benutzer einen festen Zielwert vorgeben.

In diesem Fall wird das Feuchteprofil nicht verwendet.

---

# Auswahl eines Feuchteprofils

Ein Feuchteprofil beschreibt die Nutzung eines Raumes.

Entscheidend ist nicht die tatsächliche Raumbezeichnung, sondern das gewünschte Raumklima.

Beispiele

- Ein Archiv verwendet das Profil **Lagerraum**.
- Ein Hobbyraum verwendet das Profil **Wohnraum**.
- Ein Kellerbüro verwendet das Profil **Arbeitsraum**.

---

# Abgrenzung

Feuchteprofile beschreiben ausschließlich den langfristig gewünschten Zustand des Raumklimas.

Sie beschreiben ausdrücklich keine

- Betriebsmodi
- Regelcharakteristiken
- Sonderprogramme

---

# Sonderprogramme

Temporäre Spezialanwendungen gehören nicht zum Profilsystem.

Hierzu zählen beispielsweise

- Wasserschaden
- Trocknungsprogramm
- Neubautrocknung
- Estrichtrocknung
- Bautrocknung

Diese Anwendungen werden zukünftig als eigenständige Sonderprogramme umgesetzt.

---

# Entwurfsprinzipien

## Nutzung statt Raumname

Feuchteprofile beschreiben die Nutzung eines Raumes und nicht dessen Bezeichnung.

---

## Herstellerunabhängig

Feuchteprofile sind vollständig unabhängig vom verwendeten Luftentfeuchter.

---

## Wiederverwendbar

Dieselben Profile können sowohl im Blueprint als auch in der nativen Home Assistant Integration verwendet werden.

---

## Erweiterbar

Neue Standardprofile können jederzeit ergänzt werden.

Benutzerdefinierte Profile bleiben hiervon unberührt.

---

## Trennung der Verantwortlichkeiten

Feuchteprofile definieren den gewünschten Zustand des Raumklimas.

Die Regelcharakteristik beschreibt die Art der Regelung.

Der Controller entscheidet über das Schalten des Luftentfeuchters.

---

# Zukunft

Geplante Erweiterungen umfassen unter anderem

- frei definierbare Profile
- Import und Export von Profilen
- adaptive Profile
- lernfähige Zielwerte
- regionale Empfehlungen
- automatische Profilvorschläge

---

# Zusammenfassung

Feuchteprofile bilden das fachliche Fundament des Smart Humidity Control Framework.

Sie definieren den langfristig gewünschten Zustand der **relativen Luftfeuchtigkeit** eines Raumes und bilden gemeinsam mit der Regelcharakteristik die Grundlage für eine nachvollziehbare und flexible Regelung des Raumklimas.
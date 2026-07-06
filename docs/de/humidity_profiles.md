# Feuchteprofile

Dieses Dokument beschreibt die im **Smart Humidity Control Framework** verwendeten Feuchteprofile.

Feuchteprofile definieren empfohlene Ziel-Luftfeuchtigkeiten für typische Raumtypen und Anwendungsfälle. Sie bilden die Grundlage der automatischen Feuchteregelung und ermöglichen eine einfache, nachvollziehbare Konfiguration des Controllers.

Die Feuchteprofile sind vollständig unabhängig von der verwendeten Hardware und können sowohl in der Referenzimplementierung als auch im Automation Blueprint und der zukünftigen nativen Home Assistant Integration verwendet werden.

---

# Zielsetzung

Das Ziel der Feuchteprofile besteht darin,

- typische Anwendungsfälle bereits vorkonfiguriert bereitzustellen,
- sinnvolle Ziel-Luftfeuchtigkeiten vorzuschlagen,
- eine konsistente Regelung unterschiedlicher Räume zu ermöglichen,
- den Benutzer von bauphysikalischen Detailkenntnissen zu entlasten.

Ein Feuchteprofil beschreibt ausschließlich die gewünschte Ziel-Luftfeuchtigkeit.

Es beschreibt **nicht**, wie eng oder großzügig diese Ziel-Luftfeuchtigkeit geregelt wird. Dieses Verhalten wird durch die **Regelcharakteristik** festgelegt.

---

# Grundprinzip

Jedes Feuchteprofil definiert mindestens folgende Eigenschaften:

- Profilname
- Beschreibung
- empfohlene Ziel-Luftfeuchtigkeit
- empfohlene Regelcharakteristik

Die empfohlene Regelcharakteristik dient als sinnvolle Voreinstellung und kann vom Benutzer jederzeit geändert werden.

Dadurch bleiben Feuchteprofil und Regelcharakteristik unabhängig voneinander, bilden jedoch gemeinsam die Grundlage der automatischen Regelung.

---

# Standardprofile

Das Framework stellt folgende Standardprofile bereit.

| Feuchteprofil | Ziel-Luftfeuchtigkeit | Empfohlene Regelcharakteristik | Beschreibung |
|---------------|----------------------:|--------------------------------|--------------|
| Wohnraum | 55 % | Standard | Beheizte Wohnräume mit normaler Nutzung |
| Schlafzimmer | 50 % | Standard | Schlafräume mit geringerer gewünschter Luftfeuchtigkeit |
| Badezimmer | 60 % | Großzügig | Räume mit regelmäßig hoher Feuchtelast |
| Waschküche | 60 % | Großzügig | Räume zum Waschen und gelegentlichen Trocknen von Wäsche |
| Wäschetrocknungsraum | 50 % | Streng | Räume mit regelmäßigem Wäschetrocknen |
| Arbeitsraum | 50 % | Standard | Büro-, Hobby- und Arbeitsräume |
| Technikraum | 50 % | Standard | Heizungs-, Hausanschluss- und Technikräume |
| Keller beheizt | 55 % | Standard | Beheizte Kellerräume |
| Keller unbeheizt | 55 % | Großzügig | Unbeheizte Keller mit saisonal erhöhter Luftfeuchtigkeit |
| Garage | 60 % | Großzügig | Garagen und vergleichbare Nebenräume |

---

# Beschreibung der Standardprofile

## Wohnraum

Empfohlen für typische beheizte Wohnräume.

Beispiele:

- Wohnzimmer
- Esszimmer
- Gästezimmer

Empfohlene Ziel-Luftfeuchtigkeit:

**55 %**

Empfohlene Regelcharakteristik:

**Standard**

---

## Schlafzimmer

Empfohlen für Schlafräume.

Eine etwas niedrigere Luftfeuchtigkeit wird häufig als angenehmer empfunden und reduziert das Risiko von Kondensationsfeuchte.

Empfohlene Ziel-Luftfeuchtigkeit:

**50 %**

Empfohlene Regelcharakteristik:

**Standard**

---

## Badezimmer

Empfohlen für Badezimmer und Duschbäder.

Durch regelmäßig auftretende hohe Feuchtigkeitsspitzen eignet sich eine etwas großzügigere Regelcharakteristik.

Empfohlene Ziel-Luftfeuchtigkeit:

**60 %**

Empfohlene Regelcharakteristik:

**Großzügig**

---

## Waschküche

Empfohlen für Räume, in denen Wäsche gewaschen wird.

Kurzzeitig erhöhte Luftfeuchtigkeit ist normal und wird durch eine großzügigere Regelung berücksichtigt.

Empfohlene Ziel-Luftfeuchtigkeit:

**60 %**

Empfohlene Regelcharakteristik:

**Großzügig**

---

## Wäschetrocknungsraum

Empfohlen für Räume, in denen regelmäßig Wäsche getrocknet wird.

Dieses Profil hält die Luftfeuchtigkeit bewusst niedriger und regelt enger, um den Trocknungsvorgang zu unterstützen.

Empfohlene Ziel-Luftfeuchtigkeit:

**50 %**

Empfohlene Regelcharakteristik:

**Streng**

---

## Arbeitsraum

Empfohlen für Büro-, Hobby- und Arbeitsräume.

Dieses Profil bietet ein ausgewogenes Raumklima für längere Aufenthalte und elektronische Geräte.

Empfohlene Ziel-Luftfeuchtigkeit:

**50 %**

Empfohlene Regelcharakteristik:

**Standard**

---

## Technikraum

Empfohlen für Heizungsräume, Hausanschlussräume sowie sonstige Technikräume.

Das Profil unterstützt den Schutz technischer Einrichtungen vor dauerhaft erhöhter Luftfeuchtigkeit.

Empfohlene Ziel-Luftfeuchtigkeit:

**50 %**

Empfohlene Regelcharakteristik:

**Standard**

---

## Keller beheizt

Empfohlen für beheizte Kellerräume.

Da diese Räume häufig ähnlich wie Wohnräume genutzt werden, eignet sich eine ausgewogene Regelung.

Empfohlene Ziel-Luftfeuchtigkeit:

**55 %**

Empfohlene Regelcharakteristik:

**Standard**

---

## Keller unbeheizt

Empfohlen für unbeheizte Keller.

Hier treten häufig saisonale Schwankungen der Luftfeuchtigkeit auf. Eine etwas großzügigere Regelung verhindert unnötige Schaltvorgänge.

Empfohlene Ziel-Luftfeuchtigkeit:

**55 %**

Empfohlene Regelcharakteristik:

**Großzügig**

---

## Garage

Empfohlen für Garagen sowie vergleichbare Nebenräume.

Die Luftfeuchtigkeit kann durch Fahrzeuge oder Witterungseinflüsse kurzfristig ansteigen. Das Profil berücksichtigt diese typischen Schwankungen.

Empfohlene Ziel-Luftfeuchtigkeit:

**60 %**

Empfohlene Regelcharakteristik:

**Großzügig**

---

# Benutzerdefinierte Feuchteprofile

Neben den Standardprofilen können Benutzer eigene Feuchteprofile erstellen.

Ein benutzerdefiniertes Feuchteprofil besteht mindestens aus

- Profilname
- Ziel-Luftfeuchtigkeit
- empfohlener Regelcharakteristik
- optionaler Beschreibung

Dadurch lassen sich individuelle Anforderungen oder besondere Räume einfach abbilden.

Die empfohlene Regelcharakteristik dient dabei lediglich als Voreinstellung und kann jederzeit unabhängig vom Feuchteprofil geändert werden.

---

# Zusammenhang zwischen Feuchteprofil und Regelcharakteristik

Feuchteprofil und Regelcharakteristik sind zwei voneinander unabhängige Konzepte.

Das Feuchteprofil beantwortet die Frage:

> **Welche Ziel-Luftfeuchtigkeit soll erreicht werden?**

Die Regelcharakteristik beantwortet die Frage:

> **Wie eng oder großzügig soll diese Ziel-Luftfeuchtigkeit eingehalten werden?**

Diese Trennung ermöglicht eine deutlich flexiblere Regelung.

Beispielsweise kann ein Keller sowohl mit einer **Standard-** als auch mit einer **Großzügigen Regelcharakteristik** betrieben werden, ohne dass sich das eigentliche Feuchteprofil ändert.

Für alle Standardprofile schlägt das Framework eine geeignete Regelcharakteristik vor.

Der Benutzer kann diese Empfehlung jederzeit übernehmen oder individuell anpassen.

---

# Erweiterbarkeit

Die Feuchteprofile sind bewusst unabhängig von konkreten Geräten oder Sensoren definiert.

Dadurch können zukünftige Versionen des Frameworks zusätzliche Eigenschaften ergänzen, beispielsweise

- adaptive Ziel-Luftfeuchtigkeiten
- saisonale Anpassungen
- lernfähige Feuchteprofile
- standortabhängige Empfehlungen
- bauphysikalische Bewertungen
- Taupunktregelung

ohne die bestehende Architektur zu verändern.

---

# Sonderprogramme

Bestimmte Anwendungsfälle unterscheiden sich grundlegend von der normalen Raumregelung.

Sie werden daher **nicht** als Standard-Feuchteprofile bereitgestellt.

Hierzu zählen beispielsweise

- Gebäudetrocknung nach Wasserschäden
- Bautrocknung
- Sanierungsmaßnahmen

Diese Anwendungen erfordern meist eine möglichst starke Entfeuchtung über einen begrenzten Zeitraum sowie zusätzliche Warnhinweise hinsichtlich Energieverbrauch, Materialbeanspruchung und Kondensat.

Sie sind daher als zukünftige Sonderprogramme vorgesehen.

---

# Zusammenfassung

Feuchteprofile bilden die Grundlage der automatischen Feuchteregelung.

Sie definieren die empfohlene Ziel-Luftfeuchtigkeit typischer Räume und Anwendungsfälle.

Die eigentliche Regelstrategie wird durch die unabhängig konfigurierbare Regelcharakteristik bestimmt.

Diese Trennung sorgt für eine flexible, nachvollziehbare und langfristig erweiterbare Architektur des Smart Humidity Control Framework.
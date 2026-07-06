# Glossar

Dieses Glossar definiert die im **Home Assistant Smart Humidity Control Framework** verwendeten Fachbegriffe.

Die hier definierten Begriffe gelten verbindlich für die Dokumentation, den Automation Blueprint, die spätere Home Assistant Integration sowie die Benutzeroberfläche.

---

# Framework

Das **Home Assistant Smart Humidity Control Framework** beschreibt die gesamte modulare Architektur zur intelligenten Feuchteregelung.

Das Framework besteht aus vier logisch getrennten Ebenen:

- Hardware
- Konfiguration
- Controller
- Visualisierung

Das Framework ist herstellerunabhängig und arbeitet grundsätzlich mit beliebigen geeigneten Aktoren.

---

# Aktor

Ein Aktor ist ein Gerät, das vom Controller gesteuert wird.

Der Aktor setzt die vom Framework ermittelte Regelstrategie um.

Aktuell unterstützt das Framework insbesondere:

- Luftentfeuchter

Perspektivisch sind weitere Aktoren vorgesehen, beispielsweise:

- Lüftungsanlagen
- Fensterantriebe
- Ventilatoren

Das Framework arbeitet grundsätzlich aktorunabhängig.

---

# Feuchteprofil

Ein Feuchteprofil beschreibt einen typischen Anwendungsfall der Feuchteregelung.

Es definiert insbesondere den empfohlenen Basiswert der relativen Luftfeuchtigkeit.

Beispiele für Standardprofile:

- Wohnraum
- Schlafzimmer
- Badezimmer
- Keller unbeheizt
- Garage
- Technikraum

Perspektivisch sollen Benutzer beliebige eigene Feuchteprofile anlegen, ändern und löschen können.

Der Controller arbeitet ausschließlich mit den Eigenschaften eines Feuchteprofils und niemals mit konkreten Räumen oder deren Bezeichnungen.

---

# Schutzniveau

Das Schutzniveau verschiebt den Basiswert eines Feuchteprofils.

Aktuell stehen folgende Schutzniveaus zur Verfügung:

- Komfort
- Standard
- Konservativ

Weitere Schutzniveaus können zukünftig ergänzt werden.

---

# Zielwertmodus

Der Zielwertmodus bestimmt, wie der aktuell gültige Zielwert ermittelt wird.

Aktuell stehen folgende Modi zur Verfügung:

- Feuchteprofil
- Benutzerdefiniert

Zukünftig sind weitere Zielwertmodi vorgesehen, beispielsweise:

- Taupunktgeführt
- Außenklimageführt
- Optimierungsmodus

---

# Zielwert

Der Zielwert ist die vom Controller aktuell verwendete Ziel-Luftfeuchtigkeit.

Er ergibt sich aus dem gewählten Zielwertmodus.

---

# Hysterese

Die Hysterese verhindert häufiges Ein- und Ausschalten eines Aktors.

Sie definiert den Abstand zwischen Ausschalt- und Einschaltpunkt.

---

# Einschaltgrenze

Die Einschaltgrenze beschreibt den Feuchtewert, ab dem der Controller einen Aktor einschaltet.

Sie ergibt sich aus:

- aktueller Ziel-Luftfeuchtigkeit
- Hysterese

---

# Betriebsmodus

Der Betriebsmodus bestimmt die grundsätzliche Arbeitsweise des Controllers.

Aktuell werden folgende Betriebsmodi unterstützt:

- Aus
- Automatik
- Dauerbetrieb
- Zeitbetrieb

Weitere Betriebsmodi können zukünftig ergänzt werden.

---

# Controller

Der Controller bildet die zentrale Regelungslogik des Frameworks.

Er verarbeitet:

- Sensorwerte
- berechnete Werte der Template-Sensoren
- Zielwerte
- Betriebsmodi
- Konfigurationsparameter

Auf dieser Grundlage entscheidet der Controller über den Betrieb der angeschlossenen Aktoren.

Der Controller kennt weder konkrete Räume noch bestimmte Geräte oder Hersteller.

---

# Regelalgorithmus

Der Regelalgorithmus beschreibt die fachlichen Regeln der Feuchteregelung.

Er definiert ausschließlich das gewünschte Regelverhalten und ist vollständig unabhängig von einer konkreten Implementierung.

Sowohl die Referenzimplementierung als auch der Automation Blueprint und die spätere Home Assistant Integration implementieren denselben Regelalgorithmus.

---

# Referenzimplementierung

Die Referenzimplementierung ist die aktuelle Home Assistant Implementierung des Controllers.

Sie dient als Grundlage für den Automation Blueprint sowie für die spätere native Home Assistant Integration.

---

# Automation Blueprint

Der Automation Blueprint stellt eine generische Home Assistant Implementierung des Controllers bereit.

Er ermöglicht die Wiederverwendung derselben Regelungslogik mit unterschiedlichen Sensoren, Aktoren und Installationen, ohne Änderungen am Quellcode.

---

# Native Home Assistant Integration

Die Native Home Assistant Integration ist das langfristige Ziel des Projekts.

Sie implementiert denselben Regelalgorithmus wie die Referenzimplementierung und der Automation Blueprint, stellt jedoch alle benötigten Entitäten automatisch bereit und reduziert den Konfigurationsaufwand erheblich.

---

# Geräteparameter

Geräteparameter beschreiben ausschließlich die Eigenschaften eines Aktors.

Beispiele:

- Nennleistung
- maximale Leistungsaufnahme
- Tankgröße
- Dauerablauf
- Entfeuchtungsleistung

Geräteparameter beschreiben ausschließlich das Gerät selbst.

---

# Installationsparameter

Installationsparameter beschreiben die vorhandene Installation.

Beispiele:

- Temperaturfühler
- Luftfeuchtigkeitssensor
- schaltbare Steckdose
- Außensensoren
- Wandtemperatursensoren

Installationsparameter bestimmen, welche Informationen dem Framework zur Verfügung stehen.

---

# Betriebsstatus

Der Betriebsstatus beschreibt den aktuellen Zustand des Controllers beziehungsweise des geregelten Systems.

Beispiele:

- Aus
- Automatik – Wartet
- Automatik – Entfeuchtet
- Automatik – Ziel erreicht
- Dauerbetrieb
- Zeitbetrieb aktiv

Der Betriebsstatus wird vom Controller ermittelt und dient ausschließlich der Anzeige und Auswertung.
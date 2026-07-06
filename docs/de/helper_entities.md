# Helper-Entitäten

## Zweck

Dieses Dokument beschreibt alle vom Smart Humidity Control Framework verwendeten Home-Assistant-Helfer der aktuellen Referenzimplementierung.

Die Helper-Entitäten stellen ausschließlich die vom Benutzer konfigurierbaren Parameter des Frameworks bereit.

Sie enthalten selbst keine Regelungslogik. Sämtliche Berechnungen erfolgen in den Template-Sensoren, während die eigentliche Steuerentscheidung ausschließlich vom Controller getroffen wird.

---

# Hinweis zur Referenzimplementierung

Die in diesem Dokument genannten Entity-IDs stammen aus der aktuellen Referenzimplementierung mit einem **Trotec TTK 171 ECO**.

Sie dienen ausschließlich als Beispiele.

In einer späteren Blueprint-Version werden diese Helper als Blueprint-Eingaben bereitgestellt.

In der nativen Home-Assistant-Integration werden sie vollständig durch interne Konfigurationsobjekte ersetzt.

---

# Übersicht

Die Helper sind in vier logische Gruppen unterteilt.

- Betriebsmodi
- Regelparameter
- Geräteparameter
- Zeitsteuerung

---

# Betriebsmodi

## Betriebsmodus

**Aktuelle Referenzimplementierung**

```text
input_select.trotec_ttk_171_eco_betriebsmodus
```

**Typ**

`input_select`

**Optionen**

- Aus
- Automatik
- Dauerbetrieb
- Zeitbetrieb

**Beschreibung**

Legt die aktive Betriebsart des Controllers fest.

---

## Zielwertmodus

**Aktuelle Referenzimplementierung**

```text
input_select.trotec_ttk_171_eco_zielwertmodus
```

**Typ**

`input_select`

**Optionen**

- Feuchteprofil
- Benutzerdefiniert

**Beschreibung**

Bestimmt, wie der Zielwert der relativen Luftfeuchtigkeit ermittelt wird.

---

# Regelparameter

## Feuchteprofil

**Aktuelle Referenzimplementierung**

```text
input_select.trotec_ttk_171_eco_raumtypauswahl
```

> Diese Entity-ID wird in einer späteren Version in `...feuchteprofil` umbenannt.

**Typ**

`input_select`

**Standardprofile**

- Wohnraum
- Schlafzimmer
- Badezimmer
- Büro
- Musikzimmer
- Küche
- Lagerraum
- Technikraum
- Keller beheizt
- Keller unbeheizt
- Wäschetrocknungsraum
- Waschküche
- Schwimmhalle
- Garage
- Wüste (Testprofil)

**Beschreibung**

Ein Feuchteprofil definiert den empfohlenen Basiswert der relativen Luftfeuchtigkeit für einen typischen Anwendungsfall.

Perspektivisch sollen Benutzer eigene Feuchteprofile erstellen, bearbeiten und löschen können.

---

## Regelcharakteristik

**Aktuelle Referenzimplementierung**

```text
input_select.trotec_ttk_171_eco_schutzniveau
```

**Typ**

`input_select`

**Optionen**

- Komfort
- Standard
- Konservativ

**Beschreibung**

Das Regelcharakteristik verschiebt den Basiswert des Feuchteprofils.

Zusätzlich kann es die verwendete Hysterese beeinflussen.

---

## Benutzerdefinierter Zielwert

**Aktuelle Referenzimplementierung**

```text
input_number.trotec_ttk_171_eco_eigener_zielwert
```

**Typ**

`input_number`

**Einheit**

%

**Beschreibung**

Wird verwendet, wenn der Zielwertmodus auf **Benutzerdefiniert** eingestellt ist.

---

# Geräteparameter

## Nennleistung

**Aktuelle Referenzimplementierung**

```text
input_number.trotec_ttk_171_eco_nennleistung
```

**Typ**

`input_number`

**Einheit**

W

**Beschreibung**

Nennleistung des verwendeten Luftentfeuchters.

Dieser Wert dient der Visualisierung sowie zukünftigen Effizienzbewertungen.

---

## Gauge-Maximum

**Aktuelle Referenzimplementierung**

```text
input_number.trotec_ttk_171_eco_gauge_maximum_leistung
```

**Typ**

`input_number`

**Einheit**

W

**Beschreibung**

Legt den Maximalwert des Leistungs-Gauges fest.

Dadurch kann die Dashboard-Darstellung an unterschiedliche Geräte angepasst werden.

---

# Zeitsteuerung

## Zeitbetrieb

**Aktuelle Referenzimplementierung**

```text
timer.trotec_ttk_171_eco_zeitbetrieb
```

**Typ**

`timer`

**Beschreibung**

Verwaltet die verbleibende Laufzeit eines aktiven Zeitbetriebs.

---

## Zeitbetrieb-Dauer

**Aktuelle Referenzimplementierung**

```text
input_number.trotec_ttk_171_eco_zeitbetrieb_dauer
```

**Typ**

`input_number`

**Einheit**

Minuten

**Beschreibung**

Legt die Standarddauer des Zeitbetriebs fest.

---

## Verhalten bei Zielerreichung

**Aktuelle Referenzimplementierung**

```text
input_select.trotec_ttk_171_eco_zeitbetrieb_verhalten_bei_zielerreichung
```

**Typ**

`input_select`

**Optionen**

- Ausschalten
- Auf Automatik wechseln

**Beschreibung**

Legt fest, wie sich der Controller verhält, wenn der Zielwert während eines aktiven Zeitbetriebs erreicht wird.

---

# Architekturhinweis

Die Helper-Entitäten stellen ausschließlich Benutzereingaben und Konfigurationsparameter bereit.

Sie enthalten bewusst keinerlei Regelungslogik.

```text
Benutzer
      │
      ▼
Helper-Entitäten
      │
      ▼
Template-Sensoren
      │
      ▼
Controller
      │
      ▼
Geräte
```

Diese Trennung sorgt für eine klare Architektur und erleichtert die spätere Umsetzung als Blueprint sowie als native Home-Assistant-Integration.

---

# Zukunft

Die aktuelle Referenzimplementierung verwendet Home-Assistant-Helper.

Langfristig sollen Blueprint und native Home-Assistant-Integration die Konfiguration automatisch bereitstellen und verwalten.

Dadurch entfällt das manuelle Anlegen der meisten Helper, während die zugrunde liegenden Konfigurationsparameter unverändert bestehen bleiben.
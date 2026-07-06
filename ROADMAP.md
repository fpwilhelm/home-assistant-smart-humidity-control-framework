# Roadmap

Diese Roadmap beschreibt die geplante Entwicklung des Smart Humidity Control Framework.

Sie stellt die langfristige Vision des Projekts dar und dient als Orientierung für zukünftige Versionen.

---

# Entwicklungsstand

| Version | Status |
|----------|:------:|
| Architektur | ✅ |
| Referenzimplementierung | ✅ |
| Blueprint | ⏳ |
| Native Home Assistant Integration | ⏳ |

---

# Version 1.0 – Referenzimplementierung

Ziel:

Entwicklung einer vollständigen Referenzimplementierung auf Basis eines **Trotec TTK 171 ECO**.

## Funktionen

- Betriebsmodi
- Feuchteprofile
- Schutzniveaus
- Zielwertmodi
- Automatikbetrieb
- Zeitbetrieb
- Dashboard
- Template-Sensoren
- Geräteparameter
- Leistungsüberwachung
- Energieüberwachung
- Dokumentation

Status:

🟡 In Entwicklung

---

# Version 1.1 – Blueprint

Ziel:

Überführung der Referenzimplementierung in einen generischen Home-Assistant-Blueprint.

## Geplante Funktionen

- freie Auswahl der Sensoren
- freie Auswahl des Aktors
- automatische Erstellung der benötigten Helfer
- Wiederverwendbarkeit für beliebige Luftentfeuchter

Status:

⚪ Geplant

---

# Version 2.0 – Native Home Assistant Integration

Ziel:

Entwicklung einer nativen Home-Assistant-Integration.

## Geplante Funktionen

- Config Flow
- Options Flow
- Geräteverwaltung
- automatische Entitätenerstellung
- integriertes Dashboard
- integrierte Regelungslogik

Status:

⚪ Geplant

---

# Version 3.0 – Erweiterte Feuchteregelung

## Geplante Funktionen

- Außenklima
- Außentaupunkt
- Taupunktvergleich innen/außen
- Lüftungsempfehlungen
- Kondensationsbewertung
- Schimmelrisikobewertung

Status:

⚪ Vision

---

# Version 4.0 – Smart Humidity Control

## Geplante Funktionen

- adaptive Regelalgorithmen
- lernfähige Feuchteprofile
- Optimierung des Energieverbrauchs
- mehrere Aktoren
- Lüftungsanlagen
- Ventilatoren
- Fensterantriebe

Status:

⚪ Vision

---

# Langfristige Vision

Das Smart Humidity Control Framework soll eine universelle Plattform zur intelligenten Feuchteregelung in Home Assistant werden.

Die Architektur soll unabhängig von Herstellern, Geräten und Sensoren funktionieren und unterschiedliche Aktoren unterstützen.

Im Mittelpunkt steht eine modulare, nachvollziehbare und erweiterbare Regelungslogik.
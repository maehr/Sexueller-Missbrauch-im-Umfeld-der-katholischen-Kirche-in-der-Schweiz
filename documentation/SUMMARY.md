# Entwicklung der MediaWiki-Forschungsumgebung: Executive Summary

## Überblick

Dieses Dokument bietet eine nicht-technische Zusammenfassung der iterativen Entwicklung der MediaWiki-basierten Forschungsumgebung für das Projekt "Sexueller Missbrauch im Umfeld der katholischen Kirche in der Schweiz seit Mitte des 20. Jahrhunderts".

## Von einer einfachen Wiki zu einer spezialisierten Forschungsdatenbank

### Die Ausgangslage

Das Projekt begann mit dem Bedarf, historische Daten über Missbrauchsfälle in der katholischen Kirche systematisch zu erfassen und zu analysieren. Eine standard MediaWiki-Installation bot die Grundlage für kollaborative Dokumentation.

### Die Evolution in drei Hauptphasen

#### Phase 1: Einfache Dokumentation (2024)

- **Was**: Grundlegende Wiki-Funktionen für Textdokumentation
- **Herausforderung**: Unstrukturierte Daten, schwer zu analysieren
- **Erkenntnisse**: Freie Texteingabe führt zu inkonsistenten Datenformaten

#### Phase 2: Strukturierte Datenerfassung (Ende 2024 - Anfang 2025)

- **Was**: Einführung strukturierter Formulare und Datenfelder
- **Verbesserung**: Konsistente Datenerfassung durch vordefinierte Eingabemasken
- **Nutzen**: Forscher können Daten systematisch vergleichen und analysieren

#### Phase 3: Professionelle Forschungsplattform (Mitte 2025 - heute)

- **Was**: Vollständig integrierte Forschungsumgebung mit Datenschutz-Compliance
- **Funktionen**: Automatische Analysen, sichere Datenverarbeitung, Backup-Systeme
- **Ergebnis**: Hochprofessionelle Plattform für sensible Forschungsdaten

## Evolution des Datenmodells

### Anfangs: Einfache Kategorien

- Lose Sammlung von Wiki-Seiten
- Grundlegende Kategorisierung (Personen, Fälle, Institutionen)
- Manuelle Verbindungen zwischen Informationen

### Heute: Relationales Datenmodell

Das System modelliert jetzt komplexe Beziehungen zwischen:

- **Fälle**: Zentrale Dokumentationseinheit für jeden Missbrauchsfall
- **Betroffene Personen**: Systematische (anonymisierte) Erfassung der Opfer
- **Beschuldigte**: Strukturierte Dokumentation der Täter mit institutionellem Kontext
- **Kirchliche Institutionen**: Organisationsstrukturen und Hierarchien
- **Fachgremien**: Beratende und untersuchende Körperschaften
- **Strafverfolgungsbehörden**: Staatliche Ermittlungsorgane und Verfahren

### Methodologische Entwicklungen

- **Qualitätskontrolle**: Von "Informationsstabilität" zu "Quellenkritik" (September 2025)
- **Standardisierung**: Einheitliche Altersangaben und Kategorisierungen
- **Beziehungsmodellierung**: Erfassung komplexer Machtverhältnisse und institutioneller Kontexte

## Migration von UZH zu ETHZ: Datenschutz im Fokus

### Warum der Umzug notwendig wurde

#### Datenschutz-Anforderungen

- **Sensible Daten**: Missbrauchsdokumentation erfordert höchste Sicherheitsstandards
- **Rechtliche Vorgaben**: Einhaltung strenger schweizerischer und europäischer Datenschutzgesetze
- **Forschungsethik**: Schutz der Identität von Betroffenen und deren Familien

#### Technische Herausforderungen bei UZH

- **Instabile Server**: Häufige Ausfälle und Performance-Probleme
- **Begrenzte Ressourcen**: Unzureichende Backup- und Sicherheitssysteme
- **Wartungsaufwand**: Hoher manueller Aufwand für Systembetreuung

### Die ETHZ LeoMed-Lösung

#### Spezialisierte Infrastruktur

- **LeoMed-Plattform**: Speziell für medizinische und sensible Forschungsdaten entwickelt
- **Professionelle Sicherheit**: Militärgrad-Verschlüsselung und Zugriffskontrolle
- **Compliance**: Automatische Einhaltung von Datenschutzbestimmungen

#### Verbesserte Funktionalität

- **Stabile Performance**: 99.9% Verfügbarkeit statt häufiger Ausfälle
- **Automatische Backups**: Tägliche Sicherung mit 180-Tage-Aufbewahrung
- **Nutzerfreundlichkeit**: Web-basierter Zugang zusätzlich zum Kommandozeilen-Zugriff

## Funktionale Entwicklung der Forschungsumgebung

### Von manueller zu automatisierter Datenverarbeitung

#### Früher: Manuelle Prozesse

- Forscher mussten Wiki-Syntax lernen
- Keine Datenvalidierung
- Zeitaufwändige manuelle Verknüpfungen
- Fehleranfällige Dateneingabe

#### Heute: Benutzerfreundliche Automatisierung

- **Intelligente Formulare**: Automatische Vorschläge und Validierung
- **Datenverknüpfung**: Automatische Erstellung von Beziehungen zwischen Entitäten
- **Qualitätskontrolle**: Eingebaute Konsistenz-Prüfungen
- **Export-Funktionen**: Automatische Generierung von Berichten und Analysen

### Entwicklung der Zusammenarbeit

#### Einzelforscher-System → Kollaborative Plattform

- **Mehrbenutzerfähigkeit**: Simultane Arbeit mehrerer Forscher
- **Rollensystem**: Unterschiedliche Zugriffsrechte für verschiedene Nutzertypen
- **Versionskontrolle**: Nachverfolgung aller Änderungen mit Autor und Zeitstempel
- **Staging-System**: Sichere Testumgebung für neue Funktionen

## Erkenntnisse und Lessons Learned

### Technologische Erkenntnisse

- **Strukturierte Daten sind essentiell**: Freie Texteingabe allein reicht für wissenschaftliche Analyse nicht aus
- **Benutzerfreundlichkeit entscheidend**: Komplexe Systeme müssen einfach bedienbar sein
- **Infrastruktur-Spezialisierung**: Sensible Forschungsdaten benötigen spezialisierte Hosting-Lösungen

### Forschungsmethodische Erkenntnisse

- **Terminologie entwickelt sich**: Wissenschaftliche Begriffe verfeinern sich mit der Forschung
- **Datenqualität vor Quantität**: Strukturierte, validierte Daten sind wertvoller als große Mengen unstrukturierter Informationen
- **Interdisziplinäre Zusammenarbeit**: Technologie und Geisteswissenschaften müssen eng zusammenarbeiten

### Projektmanagement-Erkenntnisse

- **Iterative Entwicklung**: Schrittweise Verbesserung ist effektiver als große Umbrüche
- **Datenschutz von Anfang an**: Sicherheitsaspekte müssen von Beginn mitgedacht werden
- **Nutzer einbeziehen**: Regelmäßiges Feedback der Forscher ist entscheidend für Erfolg

## Ausblick: Die Zukunft der Plattform

### Geplante Entwicklungen

- **Erweiterte Analyse-Tools**: Statistische Auswertungen und Visualisierungen
- **API-Integration**: Verbindung mit anderen Forschungsdatenbanken
- **Mobile Optimierung**: Zugriff auch von Tablets und Smartphones

### Langfristige Vision

Die Plattform soll als Modell für andere historische Aufarbeitungsprojekte dienen und dabei helfen, systematische Muster von institutionellem Missbrauch sichtbar zu machen.

## Fazit

Die Evolution von einer einfachen Wiki zu einer hochspezialisierten Forschungsplattform zeigt, wie sich digitale Geisteswissenschaften entwickeln können. Durch die Kombination von strukturierter Datenerfassung, benutzerfreundlichen Oberflächen und professioneller Infrastruktur ist eine Plattform entstanden, die sowohl den wissenschaftlichen Ansprüchen als auch den ethischen Anforderungen sensibler Forschung gerecht wird.

Der Umzug von UZH zu ETHZ illustriert dabei die Bedeutung von Datenschutz und spezialisierter Infrastruktur für moderne Forschungsprojekte. Die iterative Entwicklung des Datenmodells zeigt, wie sich wissenschaftliche Erkenntnisse und technische Umsetzung gegenseitig befruchten können.

---

_Diese Dokumentation wird fortlaufend aktualisiert, um die Weiterentwicklung der Forschungsumgebung zu reflektieren._

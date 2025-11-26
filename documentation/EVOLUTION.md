# Evolution der MediaWiki-Forschungsumgebung

Dieses Dokument dokumentiert die iterative Entwicklung der MediaWiki-basierten Forschungsumgebung für das Projekt "Sexueller Missbrauch im Umfeld der katholischen Kirche in der Schweiz seit Mitte des 20. Jahrhunderts" an der Universität Zürich.

## Projektüberblick

Das Projekt entwickelte sich von einem einfachen Wiki zu einer fortgeschrittenen, strukturierten Forschungsdatenbank für die historische Aufarbeitung von Missbrauchsfällen in der katholischen Kirche der Schweiz. Die Plattform unterstützt Forscher bei der systematischen Erfassung, Analyse und Dokumentation von Fällen, Personen und institutionellen Kontexten.

## Hauptentwicklungsphasen

### Phase 1: Grundlegende Wiki-Struktur

- **Ziel**: Aufbau einer grundlegenden MediaWiki-Installation
- **Technologie**: Standard MediaWiki mit MariaDB-Datenbank
- **Funktionalität**: Grundlegende Wiki-Funktionen für die Dokumentation

### Phase 2: Strukturierte Datenerfassung

- **Erweiterung um strukturierte Daten**: Integration der Cargo-Extension für datenbankähnliche Funktionalität
- **Formulare und Vorlagen**: Implementierung von Page Forms für benutzerfreundliche Dateneingabe
- **Schema-Definition**: Verwendung von Page Schemas für zentrale Schemaentwicklung

### Phase 3: Forschungsdatenmodell

- **Entwicklung des Datenmodells**: Definierung von Kernentitäten und Beziehungen
- **Spezialisierte Formulare**: Erstellung spezifischer Eingabeformulare für verschiedene Entitätstypen
- **Qualitätskontrolle**: Implementierung von Datenvalidierung und -konsistenz

### Phase 4: Infrastrukturtransfer und Sicherheit

- **Migration UZH → ETHZ**: Umzug von UZH-Servern zu ETHZ LeoMed-Infrastruktur
- **Datenschutz-Compliance**: Sicherstellung der Einhaltung von Datenschutzbestimmungen
- **Backup und Staging**: Implementierung von Produktions- und Testumgebungen

## Datenmodell-Evolution

### Kernentitäten

Das Datenmodell entwickelte sich schrittweise um folgende Hauptentitäten:

#### 1. **Fall** (Zentrale Entität)

- Verbindet Betroffene und Beschuldigte
- Dokumentiert Tatumstände, Zeiträume und Kontexte
- Verfolgt rechtliche und institutionelle Reaktionen
- Erfasst Altersangaben und Beziehungsstrukturen

#### 2. **Beschuldigter**

- Persönliche Daten (Name, Geburtsdatum, Geschlecht)
- Kirchliche Funktionen und Weihegrade
- Institutionelle Zuordnungen
- Verfolgung von Lebens- und Karrieredaten

#### 3. **Betroffener**

- Grundlegende demografische Daten
- Institutionelle Kontexte zur Tatzeit
- Schutz der Identität durch Nummernsystem

#### 4. **Kirchliche_Institution**

- Organisationsstrukturen der katholischen Kirche
- Hierarchische Zuordnungen
- Geografische und zeitliche Kontexte

#### 5. **Fachgremium**

- Beratende und untersuchende Gremien
- Expertise in Missbrauchsaufklärung
- Beziehungen zu spezifischen Fällen

#### 6. **Strafverfolgungsbehörde**

- Staatliche Ermittlungsorgane
- Verfolgung rechtlicher Prozesse
- Dokumentation von Urteilen und Verfahren

### Feldentwicklung und Terminologie

#### Bedeutende Änderungen:

- **"Informationsstabilität" → "Quellenkritik"**: Neueste Änderung zur besseren Reflexion der methodologischen Herangehensweise
- **Altersoperationalisierung**: Entwicklung standardisierter Alterskategorien für statistische Analysen
- **Beziehungstypen**: Differenzierung verschiedener Beziehungsstrukturen zwischen Betroffenen und Beschuldigten

## MediaWiki-Konfiguration Evolution

### Kern-Extensions

Das Projekt nutzt eine Kombination von MediaWiki-Extensions für strukturierte Datenerfassung:

- **Cargo**: Strukturierte Datenspeicherung und -abfrage (von einfachen Listen zu komplexen relationalen Abfragen)
- **Page Forms**: Benutzerfreundliche Formulare (von Basis-Formularen zu spezialisierten Eingabemasken)
- **Page Schemas**: Zentrale Schema-Definition mit automatischer Generierung von Vorlagen

Weitere Extensions für erweiterte Funktionalität: VisualEditor, PdfBook, DataTransfer, ReplaceText.

> **Detaillierte Konfiguration**: Siehe [CARGO_CONFIGURATION.md](../src/CARGO_CONFIGURATION.md) und [PAGEFORMS_CONFIGURATION.md](../src/PAGEFORMS_CONFIGURATION.md)

### Konfigurationsentwicklung

Das Wiki verwendet ein geschlossenes Modell mit rollenbasierten Berechtigungen und Template-Schutz. Caching ist in der Entwicklungsumgebung deaktiviert für sofortige Aktualisierungen.

### Infrastruktur-Migration: UZH → ETHZ

### Motivation für den Umzug

#### Datenschutz und Compliance:

- **Sensible Daten**: Aufgrund der hochsensiblen Natur der Missbrauchsdaten
- **Rechtliche Anforderungen**: Einhaltung strenger Datenschutzbestimmungen
- **Institutionelle Sicherheit**: Verbesserter Schutz durch spezialisierte Infrastruktur

#### Technische Vorteile:

- **LeoMed-Plattform**: Speziell für medizinische und sensible Forschungsdaten entwickelt
- **Bessere Ressourcen**: Stabilere und performantere Server-Infrastruktur
- **Backup-Strategien**: Professionelle Datensicherung mit 180-Tage-Retention

### Migration-Prozess

#### Von UZH (old-server.uzh.ch)

- **Herausforderungen**: Instabile Server, Speicher-Probleme
- **Podman-basiert**: Container-Orchestrierung mit Systemd-Services
- **Eingeschränkte Verfügbarkeit**: Häufige Ausfälle und Performance-Probleme

#### Zu ETHZ LeoMed (secure-server.leomed.ethz.ch)

- **Verbesserte Stabilität**: Zuverlässige Server-Performance
- **GUI-Zugang**: Web-basierter Zugang über OnDemand-Dashboard
- **SSH-Zugang**: Sichere Kommandozeilen-Zugriffe über Jump-Server
- **Docker-basiert**: Modernere Container-Orchestrierung

### Deployment-Evolution

Das System entwickelte sich von einer einfachen Entwicklungsumgebung zu einem professionellen Setup mit drei Umgebungen (Development, Staging, Production) und umfangreicher Automatisierung (tägliche Backups, Staging-Sync, automatische Job-Verarbeitung).

> **Detaillierte Deployment-Dokumentation**: Siehe [DEPLOYMENT.qmd](../src/DEPLOYMENT.qmd) für vollständige Architektur, Workflows und Troubleshooting

## Erkenntnisse und Lessons Learned

### Technische Erkenntnisse:

- **Extension-Kombination**: Cargo + Page Forms + Page Schemas bilden ein mächtiges Trio für strukturierte Wikis
- **Performance vs. Entwicklung**: Caching-Deaktivierung in Entwicklungsumgebungen verbessert Iteration
- **Container-Isolation**: Staging-Umgebungen ermöglichen sichereres Testen

### Forschungsmethodische Erkenntnisse:

- **Terminologie-Evolution**: Fachbegriffe entwickeln sich mit der Forschung weiter
- **Datenqualität**: Strukturierte Eingabe verbessert Konsistenz erheblich
- **Benutzerfreundlichkeit**: Formulare ermöglichen breiteren Zugang für Forscher

### Infrastruktur-Erkenntnisse:

- **Datenschutz-Compliance**: Spezialisierte Infrastrukturen bieten besseren Schutz
- **Migration-Planung**: Graduelle Migration reduziert Risiken
- **Automatisierung**: Scripts für Routine-Aufgaben verbessern Zuverlässigkeit

## Zukünftige Entwicklung

### Geplante Verbesserungen:

- **API-Integration**: Externe Datenquellen-Anbindung
- **Analytics**: Erweiterte Analyse-Funktionen für Forschungsdaten
- **Collaboration**: Verbesserte Funktionen für Teamarbeit

### Skalierbarkeit:

- **Datenvolumen**: Vorbereitung auf größere Datensätze
- **Benutzer**: Unterstützung für mehr simultane Forscher
- **Funktionalität**: Modulare Erweiterung für neue Forschungsbereiche

---

_Dieses Dokument wird kontinuierlich aktualisiert, um die Weiterentwicklung der Forschungsumgebung zu reflektieren._

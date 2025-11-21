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

#### Cargo Extension

- **Zweck**: Strukturierte Datenspeicherung und -abfrage
- **Funktionalität**: Automatische Tabellenverwaltung, komplexe Abfragen
- **Entwicklung**: Von einfachen Listen zu komplexen relationalen Abfragen

#### Page Forms Extension

- **Zweck**: Benutzerfreundliche Dateneingabe
- **Entwicklung**: Von grundlegenden Formularen zu spezialisierten Eingabemasken
- **Beitrag**: Ermöglicht Nicht-Technikern die strukturierte Dateneingabe

#### Page Schemas Extension

- **Zweck**: Zentrale Schema-Definition
- **Vorteil**: Automatische Generierung von Vorlagen und Formularen
- **Konsistenz**: Sicherstellung einheitlicher Datenstrukturen

### Weitere wichtige Extensions:

- **VisualEditor**: Vereinfachte Bearbeitung für Nicht-Techniker
- **PdfBook**: Export von Daten als PDF für Berichte
- **DataTransfer**: Import/Export-Funktionalitäten für Datenaustausch
- **ReplaceText**: Bulk-Änderungen für Datenbereinigung

### Konfigurationsentwicklung

#### Sicherheit und Zugriff:

- **Geschlossenes Wiki**: Nur registrierte Benutzer können lesen und bearbeiten
- **Rollenbasierte Berechtigungen**: Unterschiedliche Zugriffsebenen für verschiedene Benutzertypen
- **Template-Schutz**: Schutz kritischer Vorlagen vor unbeabsichtigten Änderungen

#### Performance-Optimierung:

- **Caching deaktiviert**: Für Entwicklungsumgebung zur sofortigen Aktualisierung
- **Debug-Modi**: Konfigurierbare Debug-Ausgaben für Entwicklung und Fehlerbehebung

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

#### Entwicklungsumgebungen:

- **Development**: Lokale Entwicklung mit Hot-Reload
- **Staging**: Testumgebung für Validierung von Änderungen
- **Production**: Live-System für aktive Forschung

#### Automatisierung:

- **Backup-Scripts**: Automatische tägliche Datensicherung
- **Sync-Scripts**: Synchronisation zwischen Produktions- und Testumgebung
- **Job-Processing**: Automatische Verarbeitung von Wiki-Jobs

## Technische Architektur-Entwicklung

### Container-Orchestrierung

#### Docker-Compose Evolution:

```yaml
# Frühe Version (Entwicklung)
- Einfache MediaWiki + MariaDB
- Grundlegende Volume-Mappings
- Lokale Entwicklung fokussiert

# Aktuelle Version (Produktion)
- MediaWiki + MariaDB + Staging-Umgebung
- PHPMyAdmin für Datenbank-Management
- Caddy File-Server für Dokumenten-Zugriff
- Umfangreiche Environment-Konfiguration
```

#### Volume-Management:

- **Daten-Persistierung**: Externe Volume-Mappings für Datenerhaltung
- **Image-Management**: Getrennte Verzeichnisse für Produktions- und Test-Daten
- **Backup-Integration**: Direkte Pfade für Backup-Prozesse

### Netzwerk und Sicherheit

#### Port-Konfiguration:

- **8080**: Produktions-MediaWiki
- **8081**: Staging-MediaWiki
- **8082**: PHPMyAdmin für Staging
- **8090**: Caddy File-Server

#### Umgebungsvariablen:

- **Sensible Daten**: Externe .env-Dateien für Passwörter und Schlüssel
- **Umgebungstrennung**: Separate Konfigurationen für Produktion und Staging
- **Debug-Modi**: Konfigurierbare Debug-Level

## Entwicklungsworkflow und Qualitätssicherung

### Datenerfassung-Workflow:

1. **Schema-Definition**: Entwicklung in Page Schemas
2. **Formular-Generierung**: Automatische Erstellung durch Page Forms
3. **Template-Anpassung**: Manuelle Optimierung der Anzeige
4. **Daten-Validierung**: Tests mit Staging-Umgebung
5. **Produktions-Deployment**: Transfer in Live-System

### Backup und Recovery:

- **Tägliche Backups**: Automatisierte Schema- und Daten-Sicherung
- **Versionskontrolle**: Git-basierte Nachverfolgung von Konfigurationsänderungen
- **Recovery-Tests**: Regelmäßige Validierung der Backup-Integrität

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

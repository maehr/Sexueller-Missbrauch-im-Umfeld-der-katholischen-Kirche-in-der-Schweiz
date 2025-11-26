# Sexual Abuse in the Environment of the Catholic Church in Switzerland

## Sexueller Missbrauch im Umfeld der katholischen Kirche in der Schweiz

This repository accompanies the paper "Sexueller Missbrauch im Umfeld der katholischen Kirche in der Schweiz: Aufbau einer partizipativen, iterativen und sicheren Forschungsdatenbank" submitted to the _[Zeitschrift für digitale Geisteswissenschaften](https://zfdg.de/)_ (ZfdG). It documents the technical framework and methodological approach developed for the [ongoing research project at the University of Zurich's Department of History](https://www.hist.uzh.ch/de/fachbereiche/neuzeit/privatdozierende/meier/forschung/forschungsprojekte/sexueller-missbrauch.html), which investigates sexual abuse within the Swiss Catholic Church from the mid-20th century to the present (Main Study: 2024–2026).

[![GitHub issues](https://img.shields.io/github/issues/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz.svg)](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/issues)
[![GitHub forks](https://img.shields.io/github/forks/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz.svg)](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/network)
[![GitHub stars](https://img.shields.io/github/stars/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz.svg)](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/stargazers)
[![Code license](https://img.shields.io/github/license/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz.svg)](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/blob/main/LICENSE-AGPL.md)
[![Data license](https://img.shields.io/github/license/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz.svg)](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/blob/main/LICENSE-CCBY.md)

<!-- [![DOI](https://zenodo.org/badge/1101078008.svg)](https://zenodo.org/badge/latestdoi/ZENODO_RECORD) -->

## 📋 Short Description

This repository serves as the **Replication Kit** and **Technical Framework** for the historical research project investigating sexual abuse in the Swiss Catholic Church since the mid-20th century.

It contains the data models, schemas, methodologies, and analysis scripts discussed in the associated article. This repository is archived with a permanent DOI on **Zenodo**.

**⚠️ IMPORTANT NOTE ON DATA PRIVACY:** Due to strict ethical standards, GDPR/DSGVO regulations, and the highly sensitive nature of the source material (containing severe rights violations and medical records), **this repository contains NO real personal data.** Any datasets provided here are **synthetic (dummy data)** generated solely to demonstrate the data structure and functionality of the analysis scripts. Real research data is stored securely within the [ETH Zürich _LeoMed_ infrastructure](https://sis.id.ethz.ch/services/sensitiveresearchdata/).

## 🧩 Abstract

The investigation of sexual abuse within the Swiss Catholic Church presents a dual challenge: managing a fragmented, heterogeneous archive landscape and adhering to the highest ethical standards regarding sensitive personal data.

This repository documents the project's transition from a "shared Excel table" workflow to a secure, relational, and collaborative research database built on Semantic MediaWiki. We posit that this technical infrastructure is not merely a logistical container but a **methodological investment**. By moving to a relational data model, the project was able to:

1. **Operationalize "Quellenkritik" (Source Criticism):** Moving beyond simple "truth values" to a scored assessment of source reliability, provenance, and institutional perspective.
2. **Uncover Systemic Patterns:** Enabling the quantitative detection of concealment strategies, such as the systematic transfer of accused clerics across parish and diocesan borders.
3. **Enable Collaborative Hermeneutics:** Creating a "Trading Zone" where historians and data scientists harmonize disparate archival sources (e.g., varying clerical titles across language regions).

This repository allows the digital history community to replicate our technical framework and adapt our data models for similar sensitive research contexts.

## 📁 Repository Structure

The structure of this repository follows the [Advanced Structure for Data Analysis](https://the-turing-way.netlify.app/project-design/project-repo/project-repo-advanced.html) of _The Turing Way_ and is organized as follows:

- `analysis/`: scripts and notebooks used to analyze the data
- `build/`: scripts and notebooks used to build the data
- `data/`: data files, including schemas, controlled vocabularies, and MediaWiki templates
  - `data/schemas/`: data model definitions and entity schemas
  - `data/templates/`: MediaWiki templates and forms for data entry
- `documentation/`: documentation for the data and the repository
- `paper/`: the research paper submitted to ZfdG
- `project-management/`: project management documents (e.g., meeting notes, project plans, etc.)
- `src/`: deployment infrastructure and configuration files
  - Infrastructure-as-Code examples (Docker Compose, Dockerfile)
  - MediaWiki configuration and extension setup
  - Comprehensive deployment documentation
- `test/`: tests for the data and source code
- `report.md`: a report describing the analysis of the data

## 📊 Data Description

The data in this repository consists of:

- **Data Models and Schemas**: Relational database schemas developed for Semantic MediaWiki, including entity relationships for persons, institutions, events, and archival sources
- **Synthetic Datasets**: Dummy data that demonstrates the structure and functionality of the analysis scripts without containing any real personal information
- **Analysis Scripts**: Python scripts for data processing, statistical analysis, and visualization
- **Methodology Documentation**: Documentation of the research methodology, data collection procedures, and ethical considerations

**Important Notes**:

- All datasets provided are **synthetic (dummy data)** generated for demonstration purposes only
- Real research data containing sensitive personal information is stored securely within the ETH Zürich _LeoMed_ infrastructure
- Data models include field names, descriptions, and controlled vocabularies maintained as part of the repository
- Code is released under GNU Affero General Public License v3.0 (AGPL-3.0)
- Documentation and data schemas are released under Creative Commons Attribution 4.0 International (CC BY 4.0)

## 🚀 Deployment & Infrastructure

This repository includes comprehensive Infrastructure-as-Code examples and deployment documentation for the MediaWiki-based research database. The deployment setup uses Docker and includes:

- **MediaWiki 1.43.1** with custom extensions (Cargo, PageForms, PageSchemas, DataTransfer, PdfBook)
- **MariaDB 11** for database storage
- **Caddy** as reverse proxy and file server
- **phpMyAdmin** for database administration (staging)

### Quick Start

For local development:

```bash
cd src
cp example.env .env
# Edit .env with your configuration
docker-compose -f docker-compose.dev.yml up -d --build
```

### Documentation

Detailed deployment and configuration documentation is available:

- **[Deployment Overview](src/index.qmd)** - File structure and quick start
- **[Comprehensive Deployment Guide](src/DEPLOYMENT.qmd)** - Complete deployment workflows with architecture diagrams
- **[Cargo Configuration](src/CARGO_CONFIGURATION.md)** - Cargo extension setup and usage
- **[PageForms Configuration](src/PAGEFORMS_CONFIGURATION.md)** - PageForms extension setup and usage

### Infrastructure Files

- `src/Dockerfile` - Custom MediaWiki image with all required extensions
- `src/docker-compose.dev.yml` - Development environment configuration
- `src/docker-compose.prod.yml` - Production and staging environment configuration
- `src/LocalSettings.php` - MediaWiki configuration
- `src/example.env` - Environment variables template

## 🛠️ Usage

### User Management

#### Create a New User with Admin Privileges

To create a new user with superuser privileges (bureaucrat and sysop):

```bash
docker-compose -f src/docker-compose.prod.yml exec mediawiki php maintenance/run.php --script createAndPromote.php --user "Username" --password "Password" --bureaucrat --sysop
```

#### Superuser Group

The `superuser` group is a custom user group with elevated permissions configured in `LocalSettings.php`. Users in this group have the following additional permissions:

- **delete**: Ability to delete pages
- **editinterface**: Ability to edit the MediaWiki interface (MediaWiki namespace)

To assign a user to the superuser group, use the MediaWiki Special:UserRights page or run:

```bash
docker-compose -f src/docker-compose.prod.yml exec mediawiki php maintenance/run.php --script createAndPromote.php --user "Username" --custom-groups superuser
```

Alternatively, through the web interface:

1. Navigate to `Special:UserRights`
2. Enter the username
3. Check the "superuser" group checkbox
4. Save the changes

### Update the Database Schema

```bash
docker-compose -f src/docker-compose.prod.yml exec mediawiki php maintenance/update.php --quick
docker-compose -f src/docker-compose.prod.yml exec mediawiki_staging php maintenance/update.php --quick
```

### Run Queue Jobs

```bash
docker-compose -f src/docker-compose.prod.yml exec mediawiki php maintenance/runJobs.php --maxjobs=1000
```

### Backup the Database

```bash
./src/backup_db.sh
```

### Restore the Database

```bash
./src/restore_db.sh backups/schema_backup_2024-12-01_10-45.sql backups/data_backup_2024-12-01_10-45.sql
```

## 🔧 Troubleshooting

### Fix Permissions

If you encounter permission issues with images:

```bash
docker exec -it mediawiki chown -R www-data:www-data /var/www/html/images
docker exec -it mediawiki chmod -R 755 /var/www/html/images
docker exec -it mediawiki_staging chown -R www-data:www-data /var/www/html/images
docker exec -it mediawiki_staging chmod -R 755 /var/www/html/images
```

### Reset Admin Password

```bash
docker-compose -f src/docker-compose.prod.yml exec mediawiki php maintenance/run.php --script changePassword.php --user=ADMIN_USERNAME --password=NEW_PASSWORD
docker-compose -f src/docker-compose.prod.yml exec mediawiki_staging php maintenance/run.php --script changePassword.php --user=ADMIN_USERNAME --password=NEW_PASSWORD
```

## 🔬 Use

These data are openly available to everyone and can be used for any research or educational purpose. If you use this data in your research, please cite as specified in [CITATION.cff](CITATION.cff). The following citation formats are also available through _Zenodo_:

- [BibTeX](https://zenodo.org/record/ZENODO_RECORD/export/hx)
- [CSL](https://zenodo.org/record/ZENODO_RECORD/export/csl)
- [DataCite](https://zenodo.org/record/ZENODO_RECORD/export/dcite4)
- [Dublin Core](https://zenodo.org/record/ZENODO_RECORD/export/xd)
- [DCAT](https://zenodo.org/record/ZENODO_RECORD/export/dcat)
- [JSON](https://zenodo.org/record/ZENODO_RECORD/export/json)
- [JSON-LD](https://zenodo.org/record/ZENODO_RECORD/export/schemaorg_jsonld)
- [GeoJSON](https://zenodo.org/record/ZENODO_RECORD/export/geojson)
- [MARCXML](https://zenodo.org/record/ZENODO_RECORD/export/xm)

_Zenodo_ provides an [API (REST & OAI-PMH)](https://developers.zenodo.org/) to access the data. For example, the following command will return the metadata for the most recent version of the data

```bash
curl -i https://zenodo.org/api/records/ZENODO_RECORD
```

## 💬 Support

This project is maintained by [@maehr](https://github.com/maehr). Please understand that we can't provide individual support via email. We also believe that help is much more valuable when it's shared publicly, so more people can benefit from it.

| Type                                   | Platforms                                                                                                                        |
| -------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| 🚨 **Bug Reports**                     | [GitHub Issue Tracker](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/issues)    |
| 📊 **Report bad data**                 | [GitHub Issue Tracker](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/issues)    |
| 📚 **Docs Issue**                      | [GitHub Issue Tracker](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/issues)    |
| 🎁 **Feature Requests**                | [GitHub Issue Tracker](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/issues)    |
| 🛡 **Report a security vulnerability** | See [SECURITY.md](SECURITY.md)                                                                                                   |
| 💬 **General Questions**               | [GitHub Discussions](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/discussions) |

## 🗺️ Roadmap

No changes are currently planned.

## 🤝 Contributing

All contributions to this repository are welcome! If you find errors or problems with the data, or if you want to add new data or features, please open an issue or pull request. Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## 🔢 Versioning

We use [SemVer](http://semver.org/) for versioning. The available versions are listed in the [tags on this repository](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/tags).

## 👥 Authors and acknowledgment

- **Dr. Moritz Mähr** - _Conceptualization, Software, Writing_ - [@maehr](https://github.com/maehr) - [ORCID: 0000-0002-1367-1618](https://orcid.org/0000-0002-1367-1618)
- **Dr. Lucas Federer** - _Methodology, Investigation, Data Curation_ - [ORCID: 0000-0002-3071-3058](https://orcid.org/0000-0002-3071-3058)
- **Dr. Magda Kaspar** - _Methodology, Investigation, Data Curation_ - [ORCID: 0000-0003-3102-9749](https://orcid.org/0000-0003-3102-9749)

See also the list of [contributors](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/graphs/contributors) who contributed to this project.

## 📜 License

The data in this repository is released under the Creative Commons Attribution 4.0 International (CC BY 4.0) License - see the [LICENSE-CCBY](LICENSE-CCBY.md) file for details. By using this data, you agree to give appropriate credit to the original author(s) and to indicate if any modifications have been made.

The code in this repository is released under the GNU Affero General Public License v3.0 - see the [LICENSE-AGPL](LICENSE-AGPL.md) file for details. By using this code, you agree to make any modifications available under the same license.

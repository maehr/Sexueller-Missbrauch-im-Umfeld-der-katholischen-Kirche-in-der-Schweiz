# Digital Infrastructure: Sexual Abuse in the Environment of the Catholic Church in Switzerland

### _Digitale Infrastruktur: Sexueller Missbrauch im Umfeld der katholischen Kirche in der Schweiz_

**Project Status:** Main Study (2024–2026)  
**Institution:** University of Zurich (UZH), Department of History  
**Technical Stack:** Semantic MediaWiki, Cargo, PageForms, Python/R  
**Publication:** To be published in _Zeitschrift für digitale Geisteswissenschaften_ (ZfdG)

https://www.hist.uzh.ch/de/fachbereiche/neuzeit/privatdozierende/meier/forschung/forschungsprojekte/sexueller-missbrauch.html

---

[![GitHub issues](https://img.shields.io/github/issues/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz.svg)](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/issues)
[![GitHub forks](https://img.shields.io/github/forks/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz.svg)](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/network)
[![GitHub stars](https://img.shields.io/github/stars/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz.svg)](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/stargazers)
[![Code license](https://img.shields.io/github/license/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz.svg)](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/blob/main/LICENSE-AGPL.md)
[![Data license](https://img.shields.io/github/license/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz.svg)](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/blob/main/LICENSE-CCBY.md)
[![DOI](https://zenodo.org/badge/GITHUB_REPO_ID.svg)](https://zenodo.org/badge/latestdoi/ZENODO_RECORD)

## 📋 Short Description

This repository serves as the **Replication Kit** and **Technical Framework** for the historical research project investigating sexual abuse in the Swiss Catholic Church since the mid-20th century.

It contains the data models, schemas, methodologies, and analysis scripts discussed in the associated article. This repository is archived with a permanent DOI on **Zenodo**.

**⚠️ IMPORTANT NOTE ON DATA PRIVACY:** Due to strict ethical standards, GDPR/DSGVO regulations, and the highly sensitive nature of the source material (containing severe rights violations and medical records), **this repository contains NO real personal data.** Any datasets provided here are **synthetic (dummy data)** generated solely to demonstrate the data structure and functionality of the analysis scripts. Real research data is stored securely within the ETH Zürich _LeoMed_ infrastructure.

---

## 🧩 Abstract

_Based on the article: "Sexueller Missbrauch im Umfeld der katholischen Kirche in der Schweiz: Aufbau einer partizipativen, iterativen und sicheren Forschungsdatenbank"_

The investigation of sexual abuse within the Swiss Catholic Church presents a dual challenge: managing a fragmented, heterogeneous archive landscape and adhering to the highest ethical standards regarding sensitive personal data.

This repository documents the project's transition from a "shared Excel table" workflow to a secure, relational, and collaborative research database built on Semantic MediaWiki. We posit that this technical infrastructure is not merely a logistical container but a **methodological investment**. By moving to a relational data model, the project was able to:

1. **Operationalize "Quellenkritik" (Source Criticism):** Moving beyond simple "truth values" to a scored assessment of source reliability, provenance, and institutional perspective.
    
2. **Uncover Systemic Patterns:** Enabling the quantitative detection of concealment strategies, such as the systematic transfer of accused clerics across parish and diocesan borders.
    
3. **Enable Collaborative Hermeneutics:** Creating a "Trading Zone" where historians and data scientists harmonize disparate archival sources (e.g., varying clerical titles across language regions).

This repository allows the digital history community to replicate our technical framework and adapt our data models for similar sensitive research contexts.

---

## Repository Structure

The structure of this repository follows the [Advanced Structure for Data Analysis](https://the-turing-way.netlify.app/project-design/project-repo/project-repo-advanced.html) of _The Turing Way_ and is organized as follows:

- `analysis/`: scripts and notebooks used to analyze the data
- `assets/`: images, logos, etc. used in the README and other documentation
- `build/`: scripts and notebooks used to build the data
- `data/`: data files
- `documentation/`: documentation for the data and the repository
- `project-management/`: project management documents (e.g., meeting notes, project plans, etc.)
- `src/`: source code for the data (e.g., scripts used to collect or process the data)
- `test/`: tests for the data and source code
- `report.md`: a report describing the analysis of the data

## Data Description

The data in this repository consists of:

- **Data Models and Schemas**: Relational database schemas developed for Semantic MediaWiki, including entity relationships for persons, institutions, events, and archival sources
- **Synthetic Datasets**: Dummy data that demonstrates the structure and functionality of the analysis scripts without containing any real personal information
- **Analysis Scripts**: Python and R scripts for data processing, statistical analysis, and visualization
- **Methodology Documentation**: Documentation of the research methodology, data collection procedures, and ethical considerations

**Important Notes**:
- All datasets provided are **synthetic (dummy data)** generated for demonstration purposes only
- Real research data containing sensitive personal information is stored securely within the ETH Zürich _LeoMed_ infrastructure
- Data models include field names, descriptions, and controlled vocabularies maintained as part of the repository
- Code is released under GNU Affero General Public License v3.0 (AGPL-3.0)
- Documentation and data schemas are released under Creative Commons Attribution 4.0 International (CC BY 4.0)

## Use

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

## Support

This project is maintained by [@maehr](https://github.com/maehr). Please understand that we can't provide individual support via email. We also believe that help is much more valuable when it's shared publicly, so more people can benefit from it.

| Type                                   | Platforms                                                                                                                       |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| 🚨 **Bug Reports**                     | [GitHub Issue Tracker](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/issues)    |
| 📊 **Report bad data**                 | [GitHub Issue Tracker](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/issues)    |
| 📚 **Docs Issue**                      | [GitHub Issue Tracker](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/issues)    |
| 🎁 **Feature Requests**                | [GitHub Issue Tracker](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/issues)    |
| 🛡 **Report a security vulnerability** | See [SECURITY.md](SECURITY.md)                                                                                                  |
| 💬 **General Questions**               | [GitHub Discussions](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/discussions) |

## Roadmap

No changes are currently planned.

## Contributing

All contributions to this repository are welcome! If you find errors or problems with the data, or if you want to add new data or features, please open an issue or pull request. Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## Versioning

We use [SemVer](http://semver.org/) for versioning. The available versions are listed in the [tags on this repository](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/tags).

## Authors and acknowledgment

- **Dr. Moritz Mähr** - _Conceptualization, Software, Writing_ - [@maehr](https://github.com/maehr) - [ORCID: 0000-0002-1367-1618](https://orcid.org/0000-0002-1367-1618)
- **Dr. Lucas Federer** - _Methodology, Investigation, Data Curation_ - [ORCID: 0000-0002-3071-3058](https://orcid.org/0000-0002-3071-3058)
- **Dr. Magda Kaspar** - _Methodology, Investigation, Data Curation_ - [ORCID: 0000-0003-3102-9749](https://orcid.org/0000-0003-3102-9749)

See also the list of [contributors](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/graphs/contributors) who contributed to this project.

## License

The data in this repository is released under the Creative Commons Attribution 4.0 International (CC BY 4.0) License - see the [LICENSE-CCBY](LICENSE-CCBY.md) file for details. By using this data, you agree to give appropriate credit to the original author(s) and to indicate if any modifications have been made.

The code in this repository is released under the GNU Affero General Public License v3.0 - see the [LICENSE-AGPL](LICENSE-AGPL.md) file for details. By using this code, you agree to make any modifications available under the same license.

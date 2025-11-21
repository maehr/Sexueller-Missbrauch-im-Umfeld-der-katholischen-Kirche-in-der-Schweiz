# Data Model and Data Entry Templates: Complete Overview

This document provides a comprehensive overview of the data model and data entry templates for the research database on sexual abuse in the Swiss Catholic Church.

## Document Purpose

This overview addresses [GitHub Issue #2](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/issues/2), which requests clear separation between:

1. **Data Model** (persistent structure - what is stored)
2. **Data Entry** (UI/workflow logic - how data is entered)

This separation enables:
- Independent versioning of structure and interface
- Reuse of schemas in import/export scripts
- UI changes without data model changes
- Multiple entry interfaces for the same data

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                   Research Database                          │
│          (Semantic MediaWiki + Cargo + PageForms)            │
└─────────────────────────────────────────────────────────────┘
                            │
        ┌───────────────────┴───────────────────┐
        │                                       │
        ▼                                       ▼
┌──────────────────┐                   ┌──────────────────┐
│   Data Model     │                   │   Data Entry     │
│  (What/Storage)  │                   │  (How/Interface) │
├──────────────────┤                   ├──────────────────┤
│ • Entity schemas │                   │ • Templates      │
│ • Field types    │                   │ • Forms          │
│ • Relationships  │                   │ • Categories     │
│ • Vocabularies   │                   │ • Validation     │
│ • EDTF dates     │                   │ • Help text      │
│ • Cargo tables   │                   │ • Conditional UI │
└──────────────────┘                   └──────────────────┘
        │                                       │
        └───────────────────┬───────────────────┘
                            ▼
                    ┌──────────────┐
                    │  Analysis &  │
                    │   Reporting  │
                    │              │
                    │ • Python/R   │
                    │ • Statistics │
                    │ • Viz        │
                    └──────────────┘
```

## Directory Structure

```
.
├── data/schemas/                        # Data Model (persistent structure)
│   ├── README.md                        # Schema overview
│   ├── erm-diagram.md                   # Entity-Relationship Model
│   ├── edtf-documentation.md            # Date format documentation
│   ├── faelle-schema.md                 # Case entity schema
│   ├── betroffene-schema.md             # Affected persons schema
│   ├── beschuldigte-schema.md           # Accused persons schema
│   ├── kirchliche-institutionen-schema.md   # Church institutions schema
│   ├── strafverfolgungsbehoerden-schema.md  # Law enforcement schema
│   ├── fachgremien-schema.md            # Expert committees schema
│   └── vocabularies/                    # Controlled vocabularies
│       ├── README.md
│       ├── kantone.json
│       ├── bistuemer.json
│       └── fallstatus.json
│
├── templates/                           # Data Entry (UI/workflow)
│   ├── README.md                        # Templates overview
│   ├── NOTE_MISSING_FILES.md            # Status note
│   ├── Vorlage_*.xml                    # Display templates (pending)
│   ├── Formular_*.xml                   # Entry forms (pending)
│   └── Kategorie_*.xml                  # Cargo declarations (pending)
│
└── documentation/
    ├── data-model-overview.md           # This document
    └── codelist.txt                     # Additional codelists
```

## Core Entities

The database tracks six primary entities:

### 1. FALL (Case)
**Purpose**: Central entity representing individual abuse cases

**Key Fields**:
- Unique case identifier
- Timeline (EDTF dates for uncertain periods)
- Source criticism score (1-10 reliability)
- Institutional response
- Legal proceedings
- Outcome

**Schema**: [data/schemas/faelle-schema.md](../data/schemas/faelle-schema.md)

### 2. BETROFFENER (Affected Person)
**Purpose**: Victims/survivors (pseudonymized)

**Key Fields**:
- Pseudonym identifier
- Demographics (anonymized)
- Contact status
- Support received
- Relationship to institutions

**Schema**: [data/schemas/betroffene-schema.md](../data/schemas/betroffene-schema.md)

### 3. BESCHULDIGTER (Accused Person)
**Purpose**: Accused individuals (clergy, employees, volunteers)

**Key Fields**:
- Pseudonym identifier
- Clerical role and status
- Institutional affiliations
- Transfer history (critical for pattern detection)
- Proceedings status

**Schema**: [data/schemas/beschuldigte-schema.md](../data/schemas/beschuldigte-schema.md)

### 4. KIRCHLICHE_INSTITUTION (Church Institution)
**Purpose**: Churches, schools, homes, religious orders, etc.

**Key Fields**:
- Institution type
- Geographic location
- Diocese/order affiliation
- Historical names
- Foundation/dissolution dates

**Schema**: [data/schemas/kirchliche-institutionen-schema.md](../data/schemas/kirchliche-institutionen-schema.md)

### 5. STRAFVERFOLGUNGSBEHOERDE (Law Enforcement)
**Purpose**: Prosecuting authorities and victim support services

**Key Fields**:
- Authority type
- Jurisdiction (canton/federal)
- Contact information
- Area of responsibility

**Schema**: [data/schemas/strafverfolgungsbehoerden-schema.md](../data/schemas/strafverfolgungsbehoerden-schema.md)

### 6. FACHGREMIUM (Expert Committee)
**Purpose**: Review boards, commissions, advisory panels

**Key Fields**:
- Committee type
- Mandate and composition
- Operating organization
- Independence status
- Reporting structure

**Schema**: [data/schemas/fachgremien-schema.md](../data/schemas/fachgremien-schema.md)

## Entity Relationships

See the detailed Entity-Relationship Diagram: [data/schemas/erm-diagram.md](../data/schemas/erm-diagram.md)

**Key Relationships**:
- Cases link to affected persons, accused persons, institutions, authorities, and committees
- Accused persons may be affiliated with multiple institutions over time
- Institutions may be involved in multiple cases
- Authorities may investigate multiple cases
- Committees may review multiple cases

**Cardinalities**:
- One case → Many affected persons
- One case → Many accused persons
- Many accused → Many institutions (enables transfer tracking)
- Many cases → Many authorities

## EDTF Date Handling

The database uses **Extended Date/Time Format (EDTF)** for historical dates that may be:
- **Uncertain** (`1985?`)
- **Approximate** (`1985~`)
- **Partial** (`1985` without month/day)
- **Ranges** (`1985/1990`)

This is critical because:
- Victims may not remember exact dates
- Archival records may be incomplete
- Dates protect privacy through generalization
- Historical sources vary in precision

**Full Documentation**: [data/schemas/edtf-documentation.md](../data/schemas/edtf-documentation.md)

## Controlled Vocabularies

Machine-readable vocabularies ensure consistency and enable analysis:

- **Geographic**: Cantons, language regions, dioceses
- **Institutional**: Institution types, authority types, committee types
- **Personal**: Gender, clerical roles
- **Case-related**: Case status, outcomes, proceedings status

**Directory**: [data/schemas/vocabularies/](../data/schemas/vocabularies/)

Each vocabulary includes German, French, and Italian labels to support Switzerland's multilingual context.

## Source Criticism Integration

Unlike simple "true/false" values, this data model integrates **Quellenkritik (source criticism)** as scored assessments:

**Quellenkritik Score** (1-10):
- Assesses source reliability
- Documents provenance
- Captures institutional perspective
- Enables quantitative analysis of concealment

This allows researchers to:
- Detect patterns in documentation quality
- Identify systematic gaps
- Weight evidence in analysis
- Compare church vs. state records

## Data Entry Templates

**Location**: [templates/](../templates/)

Templates define the **user interface** for data entry:

### Template Types

1. **Vorlagen (Display Templates)**
   - How entity data is displayed on pages
   - Format infoboxes and structured displays
   - Store data to Cargo tables

2. **Formulare (Entry Forms)**
   - Interactive forms for data entry
   - Dropdowns from controlled vocabularies
   - Conditional fields
   - Validation and help text

3. **Kategorien (Categories)**
   - Define Cargo table structure
   - Assign category membership
   - Default queries for category pages

### Current Status

⚠️ **Note**: XML template files from Issue #2 comment are inaccessible (GitHub attachment URLs return "Not Found"). 

See [templates/NOTE_MISSING_FILES.md](../templates/NOTE_MISSING_FILES.md) for details.

The comprehensive schema documentation provides all necessary information to:
1. Understand the intended data model
2. Create templates from scratch if needed
3. Validate templates when they become available

## Privacy and Ethics

⚠️ **CRITICAL**: This data model is designed for **synthetic/dummy data only**.

Real research data contains highly sensitive personal information and is:
- Stored in **ETH Zürich LeoMed** secure infrastructure
- Subject to **GDPR/DSGVO** and Swiss data protection laws
- Protected by **research ethics protocols**
- Requires **informed consent**

**This repository**:
- Documents the **structure** (for replication)
- Provides **synthetic examples** (for demonstration)
- Contains **no real personal data**

### Privacy by Design

The data model incorporates privacy principles:
1. **Pseudonymization**: No real names in database
2. **EDTF dates**: Approximate dates protect re-identification
3. **Separate storage**: Real data physically separate from public docs
4. **Access controls**: Who can view what (to be implemented)
5. **Audit logging**: Track data access (to be implemented)

## Research Significance

This data model enables:

### 1. Pattern Detection
- Systematic transfers of accused clergy
- Geographic distribution of cases
- Temporal trends
- Institutional response patterns

### 2. Quantitative Analysis
- Source criticism scores
- Case timelines and durations
- Institutional vs. state responses
- Support provided to victims

### 3. Cross-Language Harmonization
- "Trading Zone" between historians and data scientists
- Harmonize terminology across German/French/Italian regions
- Consistent coding of varying clerical titles

### 4. Methodological Innovation
- Moving beyond "truth value" to reliability scoring
- Operationalizing source criticism
- Relational database for fragmented archives

## Technical Stack

**Database**:
- **Semantic MediaWiki**: Collaborative wiki platform
- **Cargo**: Structured data storage and querying
- **Page Forms**: Form-based data entry

**Analysis**:
- **Python**: Data processing and statistics (scripts in `src/` and `analysis/`)
- **R**: Statistical analysis and visualization
- **Jupyter**: Notebooks for reproducible analysis

**Version Control**:
- **Git/GitHub**: Schema versioning and collaboration

## Implementation Workflow

### For Template Developers

1. Review entity schemas in `data/schemas/`
2. Create MediaWiki templates following schema specifications
3. Define Cargo table declarations in category pages
4. Create PageForms forms with controlled vocabularies
5. Test data entry and validation
6. Export as XML and commit to `templates/`

### For Data Entry Personnel

1. Log into Semantic MediaWiki instance
2. Navigate to `Special:FormStart/[EntityType]`
3. Fill form fields (use controlled vocabularies)
4. Use EDTF format for dates
5. Provide source criticism assessment
6. Save (data stored to Cargo tables)

### For Analysts

1. Query Cargo tables using Semantic MediaWiki query language
2. Export data using Cargo query API
3. Process in Python/R using scripts in `src/` and `analysis/`
4. Perform statistical analysis
5. Generate visualizations
6. Document in Jupyter notebooks

## Versioning and Evolution

### Schema Versioning

Schemas use **Semantic Versioning**:
- **MAJOR**: Breaking changes (rename/remove fields)
- **MINOR**: Add fields (backward compatible)
- **PATCH**: Clarifications, documentation

### Vocabulary Versioning

Controlled vocabularies are versioned separately:
- Each vocabulary file includes version number
- Changes documented in repository CHANGELOG
- Forms can reference specific vocabulary versions

### Migration

When schemas change:
1. Update schema documentation
2. Update templates and forms
3. Migrate existing data (if needed)
4. Update analysis scripts
5. Document breaking changes

## Quality Assurance

### Validation Layers

1. **Form Validation**: PageForms validates on entry
2. **Cargo Validation**: Type checking on storage
3. **Script Validation**: Python scripts validate against schemas
4. **Human Review**: Expert review of entries

### Data Quality Metrics

Track:
- Completeness (required fields filled)
- Consistency (controlled vocabulary compliance)
- Source quality (quellenkritik scores)
- Relationship integrity (valid entity links)

## Next Steps

To complete Issue #2 implementation:

- [x] Create directory structure
- [x] Document entity schemas with Cargo declarations
- [x] Create ERM diagram
- [x] Document EDTF date handling
- [x] Create controlled vocabularies (initial set)
- [x] Document separation of data model and data entry
- [ ] **Obtain actual XML template files** (currently inaccessible)
- [ ] Import templates into MediaWiki test instance
- [ ] Test forms and data entry workflow
- [ ] Validate template-schema alignment
- [ ] Create example synthetic records for each entity
- [ ] Document import/export procedures

## References

### Internal Documentation
- [Data Schemas README](../data/schemas/README.md)
- [Templates README](../templates/README.md)
- [ERM Diagram](../data/schemas/erm-diagram.md)
- [EDTF Documentation](../data/schemas/edtf-documentation.md)
- [Controlled Vocabularies](../data/schemas/vocabularies/)

### External Resources
- Semantic MediaWiki: https://www.semantic-mediawiki.org/
- Cargo Extension: https://www.mediawiki.org/wiki/Extension:Cargo
- Page Forms: https://www.mediawiki.org/wiki/Extension:Page_Forms
- EDTF Specification: https://www.loc.gov/standards/datetime/
- The Turing Way: https://the-turing-way.netlify.app/

### Research Context
- Main README: [../README.md](../README.md)
- UZH Research Project: https://www.hist.uzh.ch/de/fachbereiche/neuzeit/privatdozierende/meier/forschung/forschungsprojekte/sexueller-missbrauch.html

## Support

For questions:
- GitHub Issues: Technical questions, bug reports
- GitHub Discussions: General questions, ideas
- See main [README.md](../README.md) for contact information

---

**Document Status**: Complete overview of data model and templates structure  
**Last Updated**: 2024-11-21  
**Related Issue**: [#2](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/issues/2)  
**Maintainer**: [@maehr](https://github.com/maehr)

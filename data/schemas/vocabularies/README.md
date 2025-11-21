# Controlled Vocabularies

This directory contains machine-readable controlled vocabularies used throughout the database. Each vocabulary is provided in JSON format for easy validation and import into forms.

## Purpose

Controlled vocabularies ensure:
1. **Consistency**: Same terms used across all records
2. **Validation**: Data entry can be validated against allowed values
3. **Analysis**: Enables aggregation and statistical analysis
4. **Multilingual**: Can be extended with translations
5. **Evolution**: Versioned vocabulary files track changes over time

## Available Vocabularies

### Currently Implemented

#### Geographic
- [kantone.json](kantone.json) - Swiss cantons
- [bistuemer.json](bistuemer.json) - Swiss dioceses

#### Case-Related
- [fallstatus.json](fallstatus.json) - Case status values

### Planned Vocabularies

The following vocabularies are documented in entity schemas but not yet created as JSON files:

#### Geographic
- sprachregionen.json - Language regions (Deutschschweiz, Romandie, Tessin, etc.)

#### Institutional
- institutionstypen.json - Types of church institutions (parish, diocese, school, etc.)
- behoerdentypen.json - Types of law enforcement authorities
- gremientypen.json - Types of expert committees

#### Personal
- geschlecht.json - Gender values
- rollen.json - Clerical and church roles

#### Case-Related
- ausgang.json - Case outcomes
- verfahrensstatus.json - Status of proceedings
- kontaktstatus.json - Contact status with affected persons
- unterstuetzung.json - Types of support received

These vocabularies are defined inline in the entity schema files and should be extracted to JSON files as data entry needs arise.

## JSON Format

Each vocabulary file follows this structure:

```json
{
  "vocabulary_name": "Name of Vocabulary",
  "description": "Description of the vocabulary",
  "version": "1.0.0",
  "last_updated": "2024-11-21",
  "values": [
    {
      "code": "short_code",
      "label_de": "German label",
      "label_fr": "French label",
      "label_it": "Italian label",
      "description": "Optional description",
      "sort_order": 10
    }
  ]
}
```

## Multilingual Support

Vocabularies include labels in:
- **German (de)**: Primary language for most data entry
- **French (fr)**: For Romandie (French-speaking Switzerland)
- **Italian (it)**: For Ticino (Italian-speaking Switzerland)

This supports:
1. Multi-language data entry interfaces
2. Research across language regions
3. "Trading Zone" harmonization (different terms for same concepts)

## Usage

### In PageForms

```wikitext
{{{field|status|input type=dropdown|values from url=vocabularies/fallstatus.json}}}
```

### In Python

```python
import json

with open('vocabularies/fallstatus.json') as f:
    vocab = json.load(f)
    
allowed_values = [v['code'] for v in vocab['values']]
```

### In JavaScript

```javascript
fetch('vocabularies/fallstatus.json')
  .then(response => response.json())
  .then(vocab => {
    const options = vocab.values.map(v => ({
      value: v.code,
      label: v.label_de
    }));
  });
```

## Versioning

Vocabulary files use **Semantic Versioning**:
- **MAJOR**: Incompatible changes (e.g., removing values)
- **MINOR**: New values added (backward compatible)
- **PATCH**: Corrections to labels or descriptions

Track changes in `CHANGELOG.md` at repository root.

## Adding New Terms

When adding new terms to a vocabulary:

1. Update the JSON file with the new term
2. Increment the version number appropriately
3. Update `last_updated` date
4. Provide labels in all three languages
5. Assign appropriate `sort_order`
6. Document in commit message and CHANGELOG
7. Consider impact on existing data

## Extending Vocabularies

Some fields may need values not in controlled vocabularies:
- Use `sonstiges` (other) + free text in `anmerkungen`
- Propose addition to vocabulary in GitHub issue
- After review, update vocabulary and version

## References

- Eurostat Code Lists: https://ec.europa.eu/eurostat/web/metadata/code-lists
- Library of Congress Vocabularies: https://id.loc.gov/
- Getty Vocabularies: https://www.getty.edu/research/tools/vocabularies/

# Schema: FACHGREMIUM (Expert Committee)

## Description

The FACHGREMIUM entity represents expert panels, review boards, commissions, and other advisory or evaluative bodies involved in assessing cases, providing recommendations, or investigating patterns of abuse within church institutions.

## Fields

| Field Name | Type   | Required | Description                                           | Controlled Vocabulary/Notes   |
| ---------- | ------ | -------- | ----------------------------------------------------- | ----------------------------- |
| Name       | String | Yes      | Official name of the committee (serves as page title) | Free text                     |
| Typ        | String | No       | Type of committee                                     | See Committee Type vocabulary |

**Note:** The actual template uses a simplified schema with Name and Typ as the primary fields. Page title serves as the unique identifier.

## Cargo Table Declaration

```wikitext
{{#cargo_declare:
_table=Fachgremien
|Name=String
|Typ=String
}}
```

**Note:** The actual MediaWiki template stores only Name and Typ. The page title itself serves as the unique identifier and name for the committee.

## Controlled Vocabularies

### Typ (Committee Type)

- `unabhaengige_kommission` - Independent commission
- `kirchliche_kommission` - Church commission
- `beratungsgremium` - Advisory board
- `untersuchungskommission` - Investigation commission
- `ethikkommission` - Ethics committee
- `opferschutzkommission` - Victim protection committee
- `praeventiongremium` - Prevention committee
- `wissenschaftlicher_beirat` - Scientific advisory board
- `interdisziplinaeres_gremium` - Interdisciplinary panel
- `historikerkommission` - Historical commission
- `sonstiges` - Other

## Relationships

- **Fälle** (Many-to-Many): Committees review or evaluate cases

## Validation Rules

1. `Name` serves as the page title and must be unique
2. All fields are optional (no mandatory fields in form)
3. Page name is set to: `<Name>`

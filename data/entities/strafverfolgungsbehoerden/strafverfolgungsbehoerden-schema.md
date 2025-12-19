# Schema: STRAFVERFOLGUNGSBEHOERDE (Law Enforcement Authority)

## Description

The STRAFVERFOLGUNGSBEHOERDE entity represents prosecuting authorities, law enforcement agencies, and other state institutions involved in investigating or prosecuting cases of sexual abuse.

## Fields

| Field Name | Type   | Required | Description                                           | Controlled Vocabulary/Notes   |
| ---------- | ------ | -------- | ----------------------------------------------------- | ----------------------------- |
| Name       | String | Yes      | Official name of the authority (serves as page title) | Free text                     |
| Typ        | String | No       | Type of authority                                     | See Authority Type vocabulary |

**Note:** The actual template uses a simplified schema with Name and Typ as the primary fields. Page title serves as the unique identifier.

## Cargo Table Declaration

```wikitext
{{#cargo_declare:
_table=Strafverfolgungsbehörden
|Name=String
|Typ=String
}}
```

**Note:** The actual MediaWiki template stores only Name and Typ. The page title itself serves as the unique identifier and name for the authority.

## Controlled Vocabularies

### Typ (Authority Type)

- `staatsanwaltschaft` - Public Prosecutor's Office
- `kantonspolizei` - Cantonal Police
- `stadtpolizei` - City Police
- `bundesanwaltschaft` - Federal Prosecutor's Office
- `bundespolizei` - Federal Police
- `jugendanwaltschaft` - Juvenile Prosecutor's Office
- `untersuchungsrichter` - Examining Magistrate (historical)
- `opferhilfestelle` - Victim Support Service
- `ombudsstelle` - Ombudsman Office
- `sonstiges` - Other

### Kanton (Canton)

- `ag` - Aargau
- `ai` - Appenzell Innerrhoden
- `ar` - Appenzell Ausserrhoden
- `be` - Bern
- `bl` - Basel-Landschaft
- `bs` - Basel-Stadt
- `fr` - Fribourg
- `ge` - Geneva
- `gl` - Glarus
- `gr` - Graubünden
- `ju` - Jura
- `lu` - Lucerne
- `ne` - Neuchâtel
- `nw` - Nidwalden
- `ow` - Obwalden
- `sg` - St. Gallen
- `sh` - Schaffhausen
- `so` - Solothurn
- `sz` - Schwyz
- `tg` - Thurgau
- `ti` - Ticino
- `ur` - Uri
- `vd` - Vaud
- `vs` - Valais
- `zg` - Zug
- `zh` - Zurich
- `bund` - Federal

## Relationships

- **Fälle** (Many-to-Many): Cases may be reported to or investigated by authorities

## Validation Rules

1. `Name` serves as the page title and must be unique
2. All fields are optional (no mandatory fields in form)
3. Page name is set to: `<Name>`

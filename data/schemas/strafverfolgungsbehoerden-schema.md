# Schema: STRAFVERFOLGUNGSBEHOERDE (Law Enforcement Authority)

## Description

The STRAFVERFOLGUNGSBEHOERDE entity represents prosecuting authorities, law enforcement agencies, and other state institutions involved in investigating or prosecuting cases of sexual abuse.

## Fields

| Field Name | Type   | Required | Description                                               | Controlled Vocabulary/Notes     |
| ---------- | ------ | -------- | --------------------------------------------------------- | ------------------------------- |
| Name       | String | Yes      | Official name of the authority (serves as page title)     | Free text                       |
| Typ        | String | No       | Type of authority                                         | See Authority Type vocabulary   |

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

## Example Record

```json
{
	"id": "SVB-001",
	"name": "Staatsanwaltschaft Basel-Stadt",
	"typ": "staatsanwaltschaft",
	"kanton": "bs",
	"ort": "Basel",
	"zustaendigkeit": "Strafverfolgung im Kanton Basel-Stadt, inkl. Sexualdelikte",
	"kontaktinformationen": "Binningerstrasse 21, 4001 Basel, Tel: +41 61 267 87 87",
	"anmerkungen": "Zuständig für alle Strafverfahren im Kanton Basel-Stadt seit 2011 (vorher Untersuchungsrichter)"
}
```

## Validation Rules

1. `id` must be unique across all authorities
2. `id` should follow the pattern `SVB-XXX` where XXX is a sequential number
3. `typ` must be one of the defined vocabulary values
4. `kanton` must be one of the defined vocabulary values

## Research Significance

### State Response Analysis

This entity enables analysis of:

1. **Reporting Patterns**: Which cases were reported to authorities
2. **Jurisdictional Issues**: Cases crossing cantonal boundaries
3. **Temporal Changes**: How state response evolved over time
4. **Coordination**: Interaction between church and state authorities
5. **Victim Support**: Availability and use of victim support services

### Institutional Comparison

Tracking state authorities allows comparison of:

- Church institutional responses vs. state responses
- Timing: when church acted vs. when state was involved
- Outcomes: church measures vs. legal proceedings
- Geographic variations: differences between cantons

### Historical Context

The schema accounts for:

- Changes in Swiss criminal procedure (e.g., abolition of examining magistrates)
- Evolution of victim support services
- Changes in statute of limitations
- Institutional reforms over time

## Notes

- **Historical Changes**: Swiss criminal procedure has undergone reforms; `anmerkungen` field can document institutional changes
- **Federal vs. Cantonal**: Most cases involve cantonal authorities, but federal authorities may be involved in special circumstances
- **Victim Support**: Opferhilfestellen (victim support services) are important for understanding support provided to affected persons
- **Contact Information**: May change over time; record as of time of research

## References

- Controlled Vocabularies: [vocabularies/](vocabularies/)
- Related Entities: [faelle-schema.md](faelle-schema.md)
- Legal Context: Swiss Criminal Code (StGB), Victim Support Act (OHG)

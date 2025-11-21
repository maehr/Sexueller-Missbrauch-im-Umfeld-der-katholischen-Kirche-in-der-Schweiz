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

## Example Record

```json
{
	"id": "FG-001",
	"name": "Unabhängige Expertenkommission Sexueller Missbrauch im Kontext der Katholischen Kirche",
	"typ": "unabhaengige_kommission",
	"traegerschaft": "Schweizerische Bischofskonferenz",
	"einrichtungsdatum": "2019-09-01",
	"aufloesung_datum": null,
	"mandat": "Untersuchung von Fällen sexuellen Missbrauchs im Kontext der katholischen Kirche in der Schweiz; Erstellung eines wissenschaftlichen Berichts; Empfehlungen für Prävention und Aufarbeitung",
	"zusammensetzung": "Historiker, Juristinnen, Psychologen, Theologinnen; interdisziplinär besetzt; keine aktiven Kirchenvertreter",
	"berichtswesen": "Zwischenberichte an die Bischofskonferenz; Endbericht geplant für 2026; öffentliche Publikation vorgesehen",
	"anmerkungen": "Erste umfassende wissenschaftliche Aufarbeitung für die gesamte Schweiz"
}
```

## Validation Rules

1. `id` must be unique across all committees
2. `id` should follow the pattern `FG-XXX` where XXX is a sequential number
3. `typ` must be one of the defined vocabulary values
4. If `aufloesung_datum` is provided, it should be later than `einrichtungsdatum`

## Research Significance

### Institutional Response Analysis

This entity enables analysis of:

1. **Timeline of Institutional Reforms**: When were expert committees established?
2. **Independence vs. Church Control**: Who operates these committees?
3. **Mandate Evolution**: How have committee mandates changed over time?
4. **Effectiveness**: Which committees produced meaningful outcomes?
5. **Interdisciplinary Collaboration**: What expertise is represented?

### Comparative Analysis

The entity allows comparison of:

- Church-initiated vs. independent commissions
- National vs. diocesan-level committees
- Historical commissions vs. ongoing review boards
- Prevention-focused vs. investigation-focused bodies

### "Trading Zone" Documentation

Expert committees often serve as "Trading Zones" where:

- Historians and church representatives harmonize terminology
- Different language regions coordinate approaches
- Academic and pastoral perspectives meet
- Victim advocacy and institutional concerns are balanced

This entity documents these collaborative spaces.

## Types of Expert Committees in Context

### Independent Commissions

- Established with autonomy from church hierarchy
- Often include external experts (historians, jurists, psychologists)
- Tasked with comprehensive investigations
- May have subpoena or access rights to archives

### Church Commissions

- Established by dioceses or religious orders
- May include both internal and external members
- Often focused on specific dioceses or regions
- Varying degrees of independence

### Advisory Boards

- Provide ongoing consultation
- May review individual cases
- Advise on prevention and policy
- Often permanent rather than temporary

### Victim Protection/Support Committees

- Focus on victim support and compensation
- May include victim representatives
- Bridge between victims and institutions
- Often handle recognition payments

## Historical Context

Expert committees in the Swiss context emerged in waves:

1. **Early 2000s**: First diocesan-level initiatives
2. **2010s**: Increased calls for independent investigation
3. **2019+**: Establishment of national-level commissions
4. **Ongoing**: Evolution toward prevention and monitoring

This entity captures this evolution.

## Notes

- **Independence**: Document the degree of independence from church hierarchy
- **Interdisciplinarity**: Many effective committees combine historical, legal, psychological, and theological expertise
- **Transparency**: Note whether reports are public or confidential
- **Victim Involvement**: Indicate if affected persons are represented
- **Temporal Scope**: Some committees are temporary (investigation), others ongoing (prevention)

## References

- Controlled Vocabularies: [vocabularies/](vocabularies/)
- Related Entities: [faelle-schema.md](faelle-schema.md)
- Methodological Context: See main README.md discussion of "Trading Zones"

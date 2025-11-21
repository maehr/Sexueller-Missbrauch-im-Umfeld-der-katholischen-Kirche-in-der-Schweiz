# Schema: FALL (Case)

## Description

The FALL entity represents an individual case of sexual abuse. It is the central entity that links affected persons, accused persons, institutions, and authorities. Each case documents the allegations, timeline, institutional response, and outcome.

## Fields

| Field Name                | Type        | Required | Description                               | Controlled Vocabulary            |
| ------------------------- | ----------- | -------- | ----------------------------------------- | -------------------------------- |
| fallnummer                | String (PK) | Yes      | Unique case identifier                    | Auto-generated or manual         |
| titel                     | String      | Yes      | Brief descriptive title of the case       | Free text                        |
| meldedatum                | Date        | No       | Date when the case was first reported     | EDTF format as string            |
| tatzeit_von               | Date        | No       | Start date/period of alleged abuse        | EDTF format as string            |
| tatzeit_bis               | Date        | No       | End date/period of alleged abuse          | EDTF format as string            |
| tatort                    | String      | No       | Location where abuse occurred             | Free text or place vocabulary    |
| status                    | String      | Yes      | Current status of the case                | See Status vocabulary            |
| quellenkritik_score       | Integer     | No       | Source criticism reliability score (1-10) | 1=unreliable, 10=highly reliable |
| quellenkritik_anmerkungen | Text        | No       | Notes on source assessment                | Free text                        |
| zusammenfassung           | Text        | No       | Summary of the case                       | Free text                        |
| institutionelle_reaktion  | Text        | No       | Description of institutional response     | Free text                        |
| rechtliche_schritte       | Text        | No       | Legal actions taken                       | Free text                        |
| ausgang                   | String      | No       | Outcome of the case                       | See Outcome vocabulary           |
| aktenzeichen              | String      | No       | Official file reference number            | Free text                        |
| archivquelle              | String      | No       | Archival source reference                 | Free text                        |
| anmerkungen               | Text        | No       | Additional notes and comments             | Free text                        |

## Cargo Table Declaration

```wikitext
{{#cargo_declare:
_table=Faelle
|fallnummer=String (unique)
|titel=String
|meldedatum=Date
|tatzeit_von=Date
|tatzeit_bis=Date
|tatort=String
|status=String
|quellenkritik_score=Integer
|quellenkritik_anmerkungen=Text
|zusammenfassung=Text
|institutionelle_reaktion=Text
|rechtliche_schritte=Text
|ausgang=String
|aktenzeichen=String
|archivquelle=String
|anmerkungen=Text
}}
```

## Controlled Vocabularies

### Status

- `offen` - Open/Active
- `in_bearbeitung` - Under investigation
- `abgeschlossen` - Closed/Complete
- `archiviert` - Archived
- `zurueckgewiesen` - Rejected
- `ausstehend` - Pending

### Ausgang (Outcome)

- `bestaetigt` - Confirmed
- `teilweise_bestaetigt` - Partially confirmed
- `nicht_bestaetigt` - Not confirmed
- `unklar` - Unclear
- `keine_rechtlichen_schritte` - No legal action
- `vergleich` - Settlement
- `verurteilung` - Conviction
- `freispruch` - Acquittal
- `verfahren_eingestellt` - Proceedings discontinued

## Relationships

- **Betroffene** (Many-to-Many): Cases involve one or more affected persons
- **Beschuldigte** (Many-to-Many): Cases involve one or more accused persons
- **Kirchliche Institutionen** (Many-to-Many): Cases are associated with church institutions
- **Strafverfolgungsbehörden** (Many-to-Many): Cases may be reported to law enforcement
- **Fachgremien** (Many-to-Many): Cases may be reviewed by expert committees

## Example Record

```json
{
	"fallnummer": "FALL-2024-001",
	"titel": "Missbrauchsvorwurf gegen Pfarrer in Diözese Basel",
	"meldedatum": "2023-03-15",
	"tatzeit_von": "1985",
	"tatzeit_bis": "1990/1995",
	"tatort": "Pfarrei St. Martin, Basel",
	"status": "in_bearbeitung",
	"quellenkritik_score": 7,
	"quellenkritik_anmerkungen": "Primärquelle: Brief der betroffenen Person. Sekundärquelle: Kirchliche Akten.",
	"zusammenfassung": "Vorwurf des sexuellen Missbrauchs eines Minderjährigen durch einen Pfarrer im Zeitraum 1985-1990.",
	"institutionelle_reaktion": "Suspendierung des Beschuldigten nach Bekanntwerden der Vorwürfe.",
	"rechtliche_schritte": "Strafanzeige eingereicht bei Staatsanwaltschaft Basel-Stadt.",
	"ausgang": "unklar",
	"aktenzeichen": "AZ-BS-2023-456",
	"archivquelle": "Bistumsarchiv Basel, Bestand 15, Karton 234",
	"anmerkungen": "Fall erfordert weitere Recherche in den Archiven der betroffenen Pfarrei."
}
```

## Validation Rules

1. `fallnummer` must be unique across all cases
2. `quellenkritik_score` must be between 1 and 10
3. If `tatzeit_bis` is provided, it must be equal to or later than `tatzeit_von`
4. `status` must be one of the defined vocabulary values
5. If `ausgang` is provided, it must be one of the defined vocabulary values

## Notes

- **EDTF Dates**: Date fields store EDTF strings (e.g., "1985", "1985~", "1985/1990") in Cargo Date type. Cargo stores these as text strings that can be parsed by EDTF libraries in analysis scripts.
- **Quellenkritik**: The source criticism score enables quantitative analysis of source reliability and detection of concealment patterns
- **Relationships**: Use Cargo relationship tables or Semantic MediaWiki properties to link cases to other entities
- **Privacy**: This schema is for synthetic/dummy data only. Real data is stored securely per GDPR requirements.

## References

- EDTF Specification: [edtf-documentation.md](edtf-documentation.md)
- Controlled Vocabularies: [vocabularies/](vocabularies/)
- Related Entities: [beschuldigte-schema.md](beschuldigte-schema.md), [betroffene-schema.md](betroffene-schema.md)

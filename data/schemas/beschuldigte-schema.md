# Schema: BESCHULDIGTER (Accused Person)

## Description

The BESCHULDIGTER entity represents a person accused of sexual abuse. This typically includes clergy, religious order members, church employees, and volunteers. This entity uses pseudonyms in the research database while maintaining linkages to roles and institutions.

## Fields

| Field Name               | Type         | Required | Description                                     | Controlled Vocabulary/Notes               |
| ------------------------ | ------------ | -------- | ----------------------------------------------- | ----------------------------------------- |
| Nummer                   | String       | No       | Unique identifier/number                        | Auto-generated or manual                  |
| Vorname                  | String       | No       | First name (pseudonymized)                      | Free text                                 |
| Nachname                 | String       | No       | Last name (pseudonymized)                       | Free text                                 |
| Geschlecht               | String       | No       | Gender                                          | männlich, weiblich, divers, keine Angabe  |
| Geburtsdatum             | Date         | No       | Date of birth                                   | EDTF format as string                     |
| Geburtsdatum gesichert   | Boolean      | No       | Whether birth date is verified                  | Checkbox                                  |
| Sterbedatum              | Date         | No       | Date of death (if applicable)                   | EDTF format as string                     |
| Nationalität             | String       | No       | Nationality                                     | Free text                                 |
| Weihedatum               | Date         | No       | Ordination date                                 | EDTF format as string                     |
| Weihegrad                | String       | No       | Ordination level/degree                         | Free text                                 |
| Funktion                 | String       | No       | Function/role in the church                     | Checkboxes with multiple options          |
| Institutioneller Kontext | List of Page | No       | Church institutions affiliated with (page titles)| From category Kirchliche_Institutionen   |

## Cargo Table Declaration

```wikitext
{{#cargo_declare:
_table=Beschuldigte
|Nummer=String
|Vorname=String
|Nachname=String
|Geschlecht=String
|Geburtsdatum=Date
|Geburtsdatum gesichert=Boolean
|Sterbedatum=Date
|Nationalität=String
|Weihedatum=Date
|Weihegrad=String
|Funktion=String
|Institutioneller Kontext=List (;) of Page
}}
```

**Note on Cargo Types:**
- `Page` - Stores reference to another wiki page by its title
- `List (;) of Page` - Stores multiple page references
- `Boolean` - True/false checkbox
- `Date` - Date field (can contain EDTF strings)

## Controlled Vocabularies

### Geschlecht (Gender)

- `maennlich` - Male
- `weiblich` - Female
- `unbekannt` - Unknown

### Funktion_Rolle (Role)

- `priester` - Priest
- `diakon` - Deacon
- `bischof` - Bishop
- `ordensbruder` - Religious brother
- `ordensschwester` - Religious sister
- `lehrer` - Teacher
- `erzieher` - Educator
- `jugendleiter` - Youth leader
- `kirchenangestellter` - Church employee
- `freiwilliger` - Volunteer
- `sonstiges` - Other

### Bistum_Diozese (Diocese)

- `basel` - Diocese of Basel
- `chur` - Diocese of Chur
- `lausanne_genf_freiburg` - Diocese of Lausanne, Geneva and Fribourg
- `lugano` - Diocese of Lugano
- `sitten` - Diocese of Sion
- `stgallen` - Diocese of St. Gallen
- `abtei_einsiedeln` - Territorial Abbey of Einsiedeln
- `extern` - External/Foreign
- `unbekannt` - Unknown

### Status_Verfahren (Proceedings Status)

- `vorwurf_bekannt` - Allegation known
- `kirchliche_untersuchung` - Church investigation
- `staatsanwaltliche_untersuchung` - Prosecutorial investigation
- `verfahren_eingestellt` - Proceedings discontinued
- `verurteilung` - Conviction
- `freispruch` - Acquittal
- `kanonisches_verfahren` - Canonical proceedings
- `laisierung` - Laicization
- `suspendierung` - Suspension
- `keine_massnahmen` - No measures
- `verstorben` - Deceased
- `unklar` - Unclear

## Relationships

- **Fälle** (Many-to-Many): Accused persons are involved in one or more cases
- **Kirchliche Institutionen** (Many-to-Many): Affiliated with or assigned to church institutions

## Example Record

```json
{
	"id": "BESCH-001",
	"name_pseudonym": "Pfarrer X",
	"geschlecht": "maennlich",
	"geburtsdatum_edtf": "1940/1945",
	"geburtsort": "Zürich",
	"funktion_rolle": "priester",
	"ordensgemeinschaft": null,
	"bistum_diozese": "basel",
	"weihedatum": "1968",
	"taetigkeitsorte": [
		"Pfarrei St. Martin, Basel",
		"Pfarrei St. Peter, Liestal",
		"Pfarrei St. Anton, Muttenz"
	],
	"taetigkeitszeitraeume": ["1970-1985", "1985-1995", "1995-2005"],
	"status_verfahren": "verurteilung",
	"massnahmen_kirche": "Suspendierung vom Dienst nach Bekanntwerden der Vorwürfe im Jahr 2003",
	"massnahmen_staat": "Verurteilung zu 3 Jahren Freiheitsstrafe im Jahr 2005",
	"versetzungshistorie": "Auffällige Versetzungsmuster: Drei Versetzungen in 25 Jahren, jeweils kurz nach informellen Beschwerden",
	"anmerkungen": "Versetzungshistorie deutet auf systematische Vertuschung hin"
}
```

## Validation Rules

1. `id` must be unique across all accused persons
2. `id` should follow the pattern `BESCH-XXX` where XXX is a sequential number
3. `geschlecht` must be one of the defined vocabulary values if provided
4. `funktion_rolle` should be one of the defined vocabulary values if provided
5. `bistum_diozese` should be one of the defined vocabulary values if provided
6. `status_verfahren` should be one of the defined vocabulary values if provided
7. If provided, `taetigkeitsorte` and `taetigkeitszeitraeume` lists should have matching lengths

## Research Significance

### Pattern Detection

This schema enables detection of:

1. **Systematic Transfers**: Tracking movement of accused clergy across parishes and dioceses
2. **Concealment Strategies**: Identifying patterns where transfers coincide with allegations
3. **Cross-Border Issues**: Detecting transfers across diocesan or national boundaries
4. **Institutional Responses**: Documenting church vs. state measures
5. **Temporal Patterns**: Analyzing when institutions took action

### Quellenkritik Integration

The `versetzungshistorie` field is particularly important for source criticism:

- Documents official vs. informal explanations for transfers
- Captures discrepancies in institutional records
- Enables comparison of church records with witness testimonies

## Privacy Considerations

⚠️ **Note**: While accused persons have reduced privacy expectations compared to victims, this schema still uses pseudonyms in the research database. Real identifying information is stored separately in secure infrastructure.

However:

- Public figures (e.g., bishops) may be identifiable from role/location combinations
- Convicted individuals may have public records
- Research ethics still require careful handling of all personal data

## Notes

- **Versetzungshistorie**: Critical field for detecting concealment patterns
- **Multiple Affiliations**: An accused person may have multiple institutional affiliations over time
- **EDTF Dates**: Use for uncertain ordination or birth dates
- **List Fields**: Use semicolon separator for Cargo list fields

## References

- EDTF Specification: [edtf-documentation.md](edtf-documentation.md)
- Controlled Vocabularies: [vocabularies/](vocabularies/)
- Related Entities: [faelle-schema.md](faelle-schema.md), [kirchliche-institutionen-schema.md](kirchliche-institutionen-schema.md)

# Schema: BESCHULDIGTER (Accused Person)

## Description

The BESCHULDIGTER entity represents a person accused of sexual abuse. This typically includes clergy, religious order members, church employees, and volunteers. This entity uses pseudonyms in the research database while maintaining linkages to roles and institutions.

## Fields

| Field Name | Type | Required | Description | Controlled Vocabulary |
|------------|------|----------|-------------|----------------------|
| id | String (PK) | Yes | Unique identifier for the person | Auto-generated (e.g., BESCH-001) |
| name_pseudonym | String | Yes | Pseudonymized name or identifier | Free text |
| geschlecht | String | No | Gender | See Gender vocabulary |
| geburtsdatum_edtf | Date (EDTF) | No | Date of birth (approximate if necessary) | EDTF format |
| geburtsort | String | No | Place of birth | Free text |
| funktion_rolle | String | No | Function/role in the church | See Role vocabulary |
| ordensgemeinschaft | String | No | Religious order/congregation | Free text or order vocabulary |
| bistum_diozese | String | No | Diocese or jurisdiction | See Diocese vocabulary |
| weihedatum | Date (EDTF) | No | Ordination date | EDTF format |
| taetigkeitsorte | List | No | Locations/parishes where active | List of strings |
| taetigkeitszeitraeume | List | No | Periods of activity at locations | List of date ranges |
| status_verfahren | String | No | Status of proceedings | See Proceedings Status vocabulary |
| massnahmen_kirche | Text | No | Measures taken by church | Free text |
| massnahmen_staat | Text | No | Measures taken by state | Free text |
| versetzungshistorie | Text | No | History of transfers/reassignments | Free text |
| anmerkungen | Text | No | Additional notes | Free text |

## Cargo Table Declaration

```wikitext
{{#cargo_declare:
_table=Beschuldigte
|id=String (unique)
|name_pseudonym=String
|geschlecht=String
|geburtsdatum_edtf=Date
|geburtsort=String
|funktion_rolle=String
|ordensgemeinschaft=String
|bistum_diozese=String
|weihedatum=Date
|taetigkeitsorte=List (;) of String
|taetigkeitszeitraeume=List (;) of String
|status_verfahren=String
|massnahmen_kirche=Text
|massnahmen_staat=Text
|versetzungshistorie=Text
|anmerkungen=Text
}}
```

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
  "taetigkeitsorte": ["Pfarrei St. Martin, Basel", "Pfarrei St. Peter, Liestal", "Pfarrei St. Anton, Muttenz"],
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

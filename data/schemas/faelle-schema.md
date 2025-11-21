# Schema: FALL (Case)

## Description

The FALL entity represents an individual case of sexual abuse. It is the central entity that links affected persons, accused persons, institutions, and authorities. Each case documents the allegations, timeline, institutional response, and outcome.

## Fields

| Field Name                          | Type           | Required | Description                                                          | Controlled Vocabulary/Notes                              |
| ----------------------------------- | -------------- | -------- | -------------------------------------------------------------------- | -------------------------------------------------------- |
| Betroffener                         | Page           | Yes      | Reference to affected person (page title)                            | From category Betroffene                                 |
| Alter Betroffener                   | String         | No       | Age of affected person at time of abuse                              | Free text                                                |
| Alter Betroffener gesichert         | Boolean        | No       | Whether birth date is verified                                       | Checkbox                                                 |
| Alter Betroffener operationalisiert | String         | No       | Operationalized age category                                         | minderjährig, volljährig                                 |
| Beschuldigter                       | Page           | Yes      | Reference to accused person (page title)                             | From category Beschuldigte                               |
| Funktion                            | String         | No       | Function/role of accused                                             | Checkboxes: Priester, Pfarrer, etc.                      |
| Alter Beschuldigter                 | String         | No       | Age of accused at time of abuse                                      | Free text                                                |
| Alter Beschuldigter gesichert       | Boolean        | No       | Whether birth date is verified                                       | Checkbox                                                 |
| Tatkontext                          | String         | No       | Context of the abuse                                                 | Free text (e.g., Ferienlager, Beichte)                   |
| Institutioneller Kontext            | List of Page   | No       | Church institutions involved (page titles)                           | From category Kirchliche_Institutionen                   |
| Meldung an Kirche                   | Date           | No       | Date church authorities were informed                                | Date field                                               |
| Ägide                               | String         | No       | Diocese/bishop responsible at time of report                         | Dropdown with bishops and periods                        |
| Fachgremien                         | List of Page   | No       | Expert committees involved (page titles)                             | From category Fachgremien                                |
| Kanonische Voruntersuchung          | String         | No       | Whether canonical investigation occurred                             | Ja, Nein, Andere                                         |
| Genugtuungskommission behandelt     | String         | No       | Whether compensation commission handled the case                     | Ja, Nein, Andere                                         |
| Strafverfolgungsbehörden informiert | String         | No       | Whether law enforcement was informed                                 | Ja, Nein, andere                                         |
| Strafverfolgungsbehörden            | List of Page   | No       | Law enforcement authorities involved (page titles)                   | From category Strafverfolgungsbehörden                   |
| Strafverfolgungsbehörden Urteil     | String         | No       | Court verdict                                                        | Free text                                                |
| Tatort                              | String         | No       | Location where abuse occurred                                        | Free text                                                |
| Kanton                              | String         | No       | Canton where abuse occurred                                          | Dropdown with Swiss cantons                              |
| Tatzeitpunkt Tatzeitraum            | String         | No       | Time period of abuse                                                 | Free text (EDTF format)                                  |
| Art des Missbrauch                  | String         | No       | Type of abuse                                                        | Checkboxes with multiple categories                      |
| Physischer Kontakt                  | String         | No       | Whether physical contact occurred                                    | Ja, Nein, Andere                                         |
| Beziehung Betroffener Beschuldigter | String         | No       | Relationship between affected person and accused                     | Free text                                                |
| Frequenz                            | String         | No       | Frequency of abuse                                                   | Free text                                                |
| Quellenkritik                       | Text           | No       | Source criticism notes                                               | Free text                                                |

## Cargo Table Declaration

```wikitext
{{#cargo_declare:
_table=Fälle
|Betroffener=Page
|Alter Betroffener=String
|Alter Betroffener gesichert=Boolean
|Alter Betroffener operationalisiert=String
|Beschuldigter=Page
|Funktion=String
|Alter Beschuldigter=String
|Alter Beschuldigter gesichert=Boolean
|Tatkontext=String
|Institutioneller Kontext=List (;) of Page
|Meldung an Kirche=Date
|Ägide=String
|Fachgremien=List (;) of Page
|Kanonische Voruntersuchung=String
|Genugtuungskommission behandelt=String
|Strafverfolgungsbehörden informiert=String
|Strafverfolgungsbehörden=List (;) of Page
|Strafverfolgungsbehörden Urteil=String
|Tatort=String
|Kanton=String
|Tatzeitpunkt Tatzeitraum=String
|Art des Missbrauch=String
|Physischer Kontakt=String
|Beziehung Betroffener Beschuldigter=String
|Frequenz=String
|Quellenkritik=Text
}}
```

**Note on Cargo Types:**
- `Page` - Stores reference to another wiki page by its title (validates page exists)
- `List (;) of Page` - Stores multiple page references separated by semicolons
- `String` - Text field (short)
- `Text` - Text field (long, can contain wikitext)
- `Boolean` - True/false checkbox
- `Date` - Date field (can contain EDTF strings)

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
  "Betroffener": "Person A",
  "Alter Betroffener": "12",
  "Alter Betroffener gesichert": true,
  "Alter Betroffener operationalisiert": "minderjährig",
  "Beschuldigter": "Pfarrer X",
  "Funktion": "Pfarrer",
  "Alter Beschuldigter": "45",
  "Alter Beschuldigter gesichert": false,
  "Tatkontext": "Messdienergruppe",
  "Institutioneller Kontext": ["Pfarrei St. Martin Basel", "Bistum Basel"],
  "Meldung an Kirche": "2023-03-15",
  "Ägide": "Bistum Basel 1996-2010: Kurt Koch",
  "Fachgremien": ["Unabhängige Expertenkommission"],
  "Kanonische Voruntersuchung": "Ja",
  "Genugtuungskommission behandelt": "Ja",
  "Strafverfolgungsbehörden informiert": "Ja",
  "Strafverfolgungsbehörden": ["Staatsanwaltschaft Basel-Stadt"],
  "Strafverfolgungsbehörden Urteil": "Verurteilung zu 3 Jahren bedingt",
  "Tatort": "Basel",
  "Kanton": "BS",
  "Tatzeitpunkt Tatzeitraum": "1985/1990",
  "Art des Missbrauch": "Sexueller Missbrauch mit Körperkontakt",
  "Physischer Kontakt": "Ja",
  "Beziehung Betroffener Beschuldigter": "Messdiener zu Pfarrer",
  "Frequenz": "Mehrmals monatlich über 5 Jahre",
  "Quellenkritik": "Primärquelle: Brief der betroffenen Person. Sekundärquelle: Kirchliche Akten. Gut dokumentiert."
}
```

**Note:** Page references (Betroffener, Beschuldigter, etc.) use the actual page title as it appears in the wiki.

## Validation Rules

1. `Betroffener` and `Beschuldigter` are mandatory - must reference existing pages in their respective categories
2. Page references must exist in the wiki (validated by Cargo Page type)
3. List fields (Institutioneller Kontext, Fachgremien, Strafverfolgungsbehörden) can contain multiple page references separated by semicolons
4. Boolean fields accept true/false values
5. Date fields can contain EDTF format strings

## Notes

- **Page Type**: Cargo's `Page` type stores references to wiki pages by their title. This validates that referenced pages exist and enables relationship queries.
- **List of Page**: Multi-value fields use `List (;) of Page` to store multiple page references separated by semicolons.
- **EDTF Dates**: Date fields store EDTF strings (e.g., "1985", "1985~", "1985/1990") in Cargo Date type. Cargo stores these as text strings that can be parsed by EDTF libraries in analysis scripts.
- **Page Naming**: Case pages are automatically named using the pattern `<Betroffener> <Beschuldigter>` (e.g., "Person A Pfarrer X")
- **Relationships**: PageForms uses `values from category=CategoryName` to populate dropdowns/tokens fields with page titles from specific categories
- **Privacy**: This schema is for synthetic/dummy data only. Real data is stored securely per GDPR requirements.

## References

- EDTF Specification: [edtf-documentation.md](edtf-documentation.md)
- Controlled Vocabularies: [vocabularies/](vocabularies/)
- Related Entities: [beschuldigte-schema.md](beschuldigte-schema.md), [betroffene-schema.md](betroffene-schema.md)

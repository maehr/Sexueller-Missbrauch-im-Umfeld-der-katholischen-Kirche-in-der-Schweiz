# Schema: FALL (Case)

## Description

The FALL entity represents an individual case of sexual abuse. It is the central entity that links affected persons, accused persons, institutions, and authorities. Each case documents the allegations, timeline, institutional response, and outcome.

## Fields

| Field Name                          | Type         | Required | Description                                        | Controlled Vocabulary/Notes            |
| ----------------------------------- | ------------ | -------- | -------------------------------------------------- | -------------------------------------- |
| Betroffener                         | Page         | Yes      | Reference to affected person (page title)          | From category Betroffene               |
| Alter Betroffener                   | String       | No       | Age of affected person at time of abuse            | Free text                              |
| Alter Betroffener gesichert         | Boolean      | No       | Whether birth date is verified                     | Checkbox                               |
| Alter Betroffener operationalisiert | String       | No       | Operationalized age category                       | minderjährig, volljährig               |
| Beschuldigter                       | Page         | Yes      | Reference to accused person (page title)           | From category Beschuldigte             |
| Funktion                            | String       | No       | Function/role of accused                           | Checkboxes: Priester, Pfarrer, etc.    |
| Alter Beschuldigter                 | String       | No       | Age of accused at time of abuse                    | Free text                              |
| Alter Beschuldigter gesichert       | Boolean      | No       | Whether birth date is verified                     | Checkbox                               |
| Tatkontext                          | String       | No       | Context of the abuse                               | Free text (e.g., Ferienlager, Beichte) |
| Institutioneller Kontext            | List of Page | No       | Church institutions involved (page titles)         | From category Kirchliche_Institutionen |
| Meldung an Kirche                   | Date         | No       | Date church authorities were informed              | Date field                             |
| Ägide                               | String       | No       | Diocese/bishop responsible at time of report       | Dropdown with bishops and periods      |
| Fachgremien                         | List of Page | No       | Expert committees involved (page titles)           | From category Fachgremien              |
| Kanonische Voruntersuchung          | String       | No       | Whether canonical investigation occurred           | Ja, Nein, Andere                       |
| Genugtuungskommission behandelt     | String       | No       | Whether compensation commission handled the case   | Ja, Nein, Andere                       |
| Strafverfolgungsbehörden informiert | String       | No       | Whether law enforcement was informed               | Ja, Nein, andere                       |
| Strafverfolgungsbehörden            | List of Page | No       | Law enforcement authorities involved (page titles) | From category Strafverfolgungsbehörden |
| Strafverfolgungsbehörden Urteil     | String       | No       | Court verdict                                      | Free text                              |
| Tatort                              | String       | No       | Location where abuse occurred                      | Free text                              |
| Kanton                              | String       | No       | Canton where abuse occurred                        | Dropdown with Swiss cantons            |
| Tatzeitpunkt Tatzeitraum            | String       | No       | Time period of abuse                               | Free text (EDTF format)                |
| Art des Missbrauch                  | String       | No       | Type of abuse                                      | Checkboxes with multiple categories    |
| Physischer Kontakt                  | String       | No       | Whether physical contact occurred                  | Ja, Nein, Andere                       |
| Beziehung Betroffener Beschuldigter | String       | No       | Relationship between affected person and accused   | Free text                              |
| Frequenz                            | String       | No       | Frequency of abuse                                 | Free text                              |
| Quellenkritik                       | Text         | No       | Source criticism notes                             | Free text                              |

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

**Note:** Page references (Betroffener, Beschuldigter, etc.) use the actual page title as it appears in the wiki.

## Validation Rules

1. `Betroffener` is mandatory - must reference existing page in category Betroffene
2. `Beschuldigter` is mandatory - must reference existing page in category Beschuldigte
3. `Alter Betroffener operationalisiert` must be one of: minderjährig, volljährig
4. `Funktion` values must be from: Priester, Pfarrer, Kaplan/Vikar/Pfarrhelfer (geweiht), Ordensbruder/Ordensschwester, Pater, Spiritual, Pfarr-Resignat, Katechet/-in, Pastoralassistent/-in, Gemeindeleiter/-in, Sakristan/-in, Diakon, Ständiger Diakon, Chorherr/Domherr, Novize/Novizin, Diözesanbischof, Erzbischof, Weihbischof, Apostolischer Vikar, Titularbischof, Kardinal, Lehrer/-in, Vorsteher/-in Gemeinschaft, Erzieher/-in, Rektor/Direktor/Präfekt, Missionar/-in, Andere
5. `Frequenz` must be one of: einmalig, mehrmalig
6. `Physischer Kontakt` must be one of: kein physischer Kontakt, physischer Kontakt
7. `Art des Missbrauch` values must be from: Kuss, Zungenkuss, Umarmung, Exhibition des Opfers, Exhibition des Täters, Selbstbefriedigung des Opfers, Selbstbefriedigung des Täters, Berührungen über den Kleidern, Berührung unter den Kleidern, Berührungen der Genitalien des Opfers, Berührungen der Genitalien des Täters, orale Penetration am Opfer, orale Penetration am Täter, vaginale Penetration am Opfer, vaginale Penetration am Täter, anale Penetration am Opfer, anale Penetration am Täter, Andere, Versuch
8. `Kanton` must be one of: Aargau, Appenzell Ausserrhoden, Appenzell Innerrhoden, Basel-Landschaft, Basel-Stadt, Bern, Freiburg, Genf, Glarus, Graubünden, Jura, Luzern, Neuenburg, Nidwalden, Obwalden, Schaffhausen, Schwyz, Solothurn, St. Gallen, Tessin, Thurgau, Uri, Waadt, Wallis, Zug, Zürich, Fürstentum Liechtenstein, Ausland, andere
9. `Institutioneller Kontext` must reference existing pages in category Kirchliche_Institutionen
10. `Fachgremien` must reference existing pages in category Fachgremien
11. `Kanonische Voruntersuchung` must be one of: Ja, Nein, Andere
12. `Genugtuungskommission behandelt` must be one of: Ja - angenommen, Ja - abgelehnt, Ja - Ergebnis unklar, Nein
13. `Strafverfolgungsbehörden informiert` must be one of: Ja, Nein, andere
14. `Strafverfolgungsbehörden` must reference existing pages in category Strafverfolgungsbehörden
15. `Strafverfolgungsbehörden Urteil` must be one of: Nichtannahme, Freigesprochen, Verurteilt, Eingestellt
16. `Quellenkritik` must be one of: Score 1, Score 2, Score 3
17. Page name is auto-generated as: `<Betroffener> <Beschuldigter>`

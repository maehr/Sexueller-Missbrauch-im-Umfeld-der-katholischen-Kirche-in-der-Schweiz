# Schema: BESCHULDIGTER (Accused Person)

## Description

The BESCHULDIGTER entity represents a person accused of sexual abuse. This typically includes clergy, religious order members, church employees, and volunteers. This documentation uses synthetic data only.

## Fields

| Field Name               | Type         | Required | Description                                       | Controlled Vocabulary/Notes              |
| ------------------------ | ------------ | -------- | ------------------------------------------------- | ---------------------------------------- |
| Nummer                   | String       | No       | Unique identifier/number                          | Auto-generated or manual                 |
| Vorname                  | String       | No       | First name (pseudonymized)                        | Free text                                |
| Nachname                 | String       | No       | Last name (pseudonymized)                         | Free text                                |
| Geschlecht               | String       | No       | Gender                                            | männlich, weiblich, divers, keine Angabe |
| Geburtsdatum             | Date         | No       | Date of birth                                     | EDTF format as string                    |
| Geburtsdatum gesichert   | Boolean      | No       | Whether birth date is verified                    | Checkbox                                 |
| Sterbedatum              | Date         | No       | Date of death (if applicable)                     | EDTF format as string                    |
| Nationalität             | String       | No       | Nationality                                       | Free text                                |
| Weihedatum               | Date         | No       | Ordination date                                   | EDTF format as string                    |
| Weihegrad                | String       | No       | Ordination level/degree                           | Free text                                |
| Funktion                 | String       | No       | Function/role in the church                       | Checkboxes with multiple options         |
| Institutioneller Kontext | List of Page | No       | Church institutions affiliated with (page titles) | From category Kirchliche_Institutionen   |

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

1. `Nummer` is mandatory (required field in form)
2. `Geschlecht` must be one of: männlich, weiblich, andere
3. `Nationalität` must be one of: Schweizer, Ausländer
4. `Funktion` values must be from: Priester, Pfarrer, Kaplan/Vikar/Pfarrhelfer (geweiht), Ordensbruder/Ordensschwester, Pater, Spiritual, Pfarr-Resignat, Katechet/-in, Pastoralassistent/-in, Gemeindeleiter/-in, Sakristan/-in, Diakon, Ständiger Diakon, Chorherr/Domherr, Novize/Novizin, Diözesanbischof, Erzbischof, Weihbischof, Apostolischer Vikar, Titularbischof, Kardinal, Lehrer/-in, Vorsteher/-in Gemeinschaft, Erzieher/-in, Rektor/Direktor/Präfekt, Missionar/-in, Andere
5. `Weihegrad` must be one of: Weltpriester, Ordenspriester, Laie ohne Gelübde, Laie mit Gelübde, ständiger Diakon, temporärer Diakon, Bischof
6. `Institutioneller Kontext` must reference existing pages in category Kirchliche_Institutionen
7. Page name is auto-generated as: `<Nachname> <Vorname> TAE<Nummer>`

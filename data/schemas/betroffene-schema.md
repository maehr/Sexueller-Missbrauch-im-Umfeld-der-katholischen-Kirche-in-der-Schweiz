# Schema: BETROFFENER (Affected Person)

## Description

The BETROFFENER entity represents a person affected by sexual abuse (victim/survivor). This documentation uses synthetic data only.

## Fields

| Field Name               | Type         | Required | Description                                       | Controlled Vocabulary/Notes              |
| ------------------------ | ------------ | -------- | ------------------------------------------------- | ---------------------------------------- |
| Nummer                   | String       | No       | Unique identifier/number                          | Auto-generated or manual                 |
| Vorname                  | String       | No       | First name (pseudonymized)                        | Free text                                |
| Nachname                 | String       | No       | Last name (pseudonymized)                         | Free text                                |
| Geschlecht               | String       | No       | Gender                                            | männlich, weiblich, divers, keine Angabe |
| Geburtsdatum             | Date         | No       | Date of birth (anonymized/approximate)            | EDTF format as string                    |
| Geburtsdatum gesichert   | Boolean      | No       | Whether birth date is verified                    | Checkbox                                 |
| Institutioneller Kontext | List of Page | No       | Church institutions associated with (page titles) | From category Kirchliche_Institutionen   |

## Cargo Table Declaration

```wikitext
{{#cargo_declare:
_table=Betroffene
|Nummer=String
|Vorname=String
|Nachname=String
|Geschlecht=String
|Geburtsdatum=Date
|Geburtsdatum gesichert=Boolean
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
- `divers` - Non-binary/Diverse
- `unbekannt` - Unknown
- `keine_angabe` - Prefer not to say

### Kontaktstatus (Contact Status)

- `erstkontakt` - Initial contact
- `aktiv` - Active communication
- `abgeschlossen` - Contact concluded
- `kein_kontakt` - No contact established
- `kontakt_abgebrochen` - Contact discontinued
- `verstorben` - Deceased

### Unterstuetzung_erhalten (Support Received)

- `keine` - None
- `beratung` - Counseling
- `therapie` - Therapy
- `finanzielle_entschaedigung` - Financial compensation
- `rechtsbeistand` - Legal assistance
- `kirche_anerkennungszahlung` - Church recognition payment
- `staatliche_unterstuetzung` - State support
- `unklar` - Unclear

## Relationships

- **Fälle** (Many-to-Many): Affected persons are involved in one or more cases
- **Kirchliche Institutionen** (Many-to-Many): May have contacted or been associated with institutions

## Example Record

```json
{
	"id": "BET-001",
	"name_pseudonym": "Person A",
	"geschlecht": "maennlich",
	"geburtsdatum_edtf": "1965~",
	"geburtsort": "Basel (anonymisiert)",
	"kontaktstatus": "aktiv",
	"erstkontakt_datum": "2023-05-20",
	"beziehung_institution": "Ehemaliger Messdiener",
	"zeitraum_kontakt": "1978-1982",
	"unterstuetzung_erhalten": "beratung, therapie",
	"anmerkungen": "Person hat sich direkt an die Forschungsgruppe gewandt. Bereit zur weiteren Zusammenarbeit."
}
```

## Validation Rules

1. `Nummer` is mandatory (required field in form)
2. `Geschlecht` must be one of: männlich, weiblich, andere
3. `Institutioneller Kontext` must reference existing pages in category Kirchliche_Institutionen
4. Page name is auto-generated as: `<Nachname> <Vorname> BET<Nummer>`

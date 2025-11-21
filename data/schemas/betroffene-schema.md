# Schema: BETROFFENER (Affected Person)

## Description

The BETROFFENER entity represents a person affected by sexual abuse (victim/survivor). This entity uses pseudonyms and anonymized data to protect privacy. Real identifying information is stored separately in secure infrastructure per GDPR requirements.

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

1. `id` must be unique across all affected persons
2. `id` should follow the pattern `BET-XXX` where XXX is a sequential number
3. `geschlecht` must be one of the defined vocabulary values if provided
4. `kontaktstatus` must be one of the defined vocabulary values if provided
5. `geburtsdatum_edtf` should use EDTF format for approximate/uncertain dates

## Privacy and Ethical Considerations

⚠️ **CRITICAL**: This schema is designed for **synthetic/dummy data only**.

Real data involving affected persons contains highly sensitive personal information and is subject to:

- **GDPR/DSGVO** requirements
- **Swiss data protection laws** (nFADP)
- **Research ethics protocols**
- **Informed consent** requirements

Real research data is stored in:

- **ETH Zürich LeoMed infrastructure** (secure, access-controlled)
- Separate from this public repository
- With strict access controls and audit logging

### Anonymization Principles

When creating synthetic data:

1. Use pseudonyms, never real names
2. Approximate or range dates (EDTF) rather than exact dates
3. Generalize locations where necessary
4. Remove or obscure any identifying details
5. Ensure no combination of fields can re-identify individuals

## Notes

- **Pseudonymization**: All names are pseudonyms in research database
- **EDTF Dates**: Use approximate dates (e.g., "1965~") to protect privacy while maintaining analytical utility
- **Relationship Tracking**: Links to cases enable pattern analysis while maintaining privacy
- **Support Tracking**: Documents institutional and state responses to affected persons

## References

- EDTF Specification: [edtf-documentation.md](edtf-documentation.md)
- Controlled Vocabularies: [vocabularies/](vocabularies/)
- Related Entities: [faelle-schema.md](faelle-schema.md), [kirchliche-institutionen-schema.md](kirchliche-institutionen-schema.md)
- Privacy Documentation: See main README.md and GDPR compliance notes

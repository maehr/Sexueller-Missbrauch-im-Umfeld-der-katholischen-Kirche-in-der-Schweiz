# Schema: KIRCHLICHE_INSTITUTION (Church Institution)

## Description

The KIRCHLICHE_INSTITUTION entity represents church institutions including dioceses, parishes, religious orders, schools, youth homes, and other church-affiliated organizations relevant to cases of abuse.

## Fields

| Field Name | Type   | Required | Description                                             | Controlled Vocabulary/Notes     |
| ---------- | ------ | -------- | ------------------------------------------------------- | ------------------------------- |
| Name       | String | Yes      | Official name of the institution (serves as page title) | Free text                       |
| Typ        | String | No       | Type of institution                                     | See Institution Type vocabulary |

**Note:** The actual template uses a simplified schema with Name and Typ as the primary fields. Page title serves as the unique identifier.

## Cargo Table Declaration

```wikitext
{{#cargo_declare:
_table=Kirchliche_Institutionen
|Name=String
|Typ=String
}}
```

**Note:** The actual MediaWiki template stores only Name and Typ. The page title itself serves as the unique identifier and name for the institution.

## Controlled Vocabularies

### Typ (Institution Type)

- `bistum` - Diocese
- `pfarrei` - Parish
- `kloster` - Monastery/Convent
- `ordensniederlassung` - Religious order house
- `katholische_schule` - Catholic school
- `internat` - Boarding school
- `kinderheim` - Children's home
- `jugendheim` - Youth home
- `priesterseminar` - Seminary
- `katholische_organisation` - Catholic organization
- `jugendverband` - Youth organization
- `caritas_einrichtung` - Caritas facility
- `krankenhaus` - Hospital
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
- `ausland` - Foreign

### Sprachregion (Language Region)

- `deutschschweiz` - German-speaking Switzerland
- `romandie` - French-speaking Switzerland
- `tessin` - Italian-speaking Switzerland
- `raetoromanen` - Romansh-speaking areas
- `mehrsprachig` - Multilingual

## Relationships

- **Fälle** (Many-to-Many): Cases are associated with institutions
- **Beschuldigte** (Many-to-Many): Accused persons are affiliated with institutions
- **Betroffene** (Many-to-Many): Affected persons may have been associated with institutions

## Example Record

```json
{
	"id": "INST-001",
	"name": "Pfarrei St. Martin",
	"name_historisch": ["Pfarrei zum Heiligen Martin", "St. Martinskirche Pfarrei"],
	"typ": "pfarrei",
	"bistum_ordensgemeinschaft": "Bistum Basel",
	"ort_gemeinde": "Basel",
	"kanton": "bs",
	"adresse": "Martinsplatz 1, 4051 Basel",
	"gruendungsjahr": "1850",
	"aufloesung_jahr": null,
	"traegerschaft": "Römisch-katholische Kirchgemeinde Basel",
	"sprachregion": "deutschschweiz",
	"anmerkungen": "Große Innenstadtpfarrei mit angeschlossener Grundschule bis 1980"
}
```

## Validation Rules

1. `Name` serves as the page title and must be unique
2. All fields are optional (no mandatory fields in form)
3. Page name is set to: `<Name>`

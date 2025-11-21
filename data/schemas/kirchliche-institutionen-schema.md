# Schema: KIRCHLICHE_INSTITUTION (Church Institution)

## Description

The KIRCHLICHE_INSTITUTION entity represents church institutions including dioceses, parishes, religious orders, schools, youth homes, and other church-affiliated organizations relevant to cases of abuse.

## Fields

| Field Name | Type | Required | Description | Controlled Vocabulary |
|------------|------|----------|-------------|----------------------|
| id | String (PK) | Yes | Unique identifier for the institution | Auto-generated (e.g., INST-001) |
| name | String | Yes | Official name of the institution | Free text |
| name_historisch | List | No | Historical names of the institution | List of strings |
| typ | String | Yes | Type of institution | See Institution Type vocabulary |
| bistum_ordensgemeinschaft | String | No | Parent diocese or religious order | Free text |
| ort_gemeinde | String | No | Town/municipality | Free text |
| kanton | String | No | Canton | See Canton vocabulary |
| adresse | Text | No | Address | Free text |
| gruendungsjahr | Date | No | Year of foundation | EDTF format as string |
| aufloesung_jahr | Date | No | Year of dissolution (if applicable) | EDTF format as string |
| traegerschaft | String | No | Operating organization | Free text |
| sprachregion | String | No | Language region | See Language Region vocabulary |
| anmerkungen | Text | No | Additional notes | Free text |

## Cargo Table Declaration

```wikitext
{{#cargo_declare:
_table=Kirchliche_Institutionen
|id=String (unique)
|name=String
|name_historisch=List (;) of String
|typ=String
|bistum_ordensgemeinschaft=String
|ort_gemeinde=String
|kanton=String
|adresse=Text
|gruendungsjahr=Date
|aufloesung_jahr=Date
|traegerschaft=String
|sprachregion=String
|anmerkungen=Text
}}
```

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

1. `id` must be unique across all institutions
2. `id` should follow the pattern `INST-XXX` where XXX is a sequential number
3. `typ` must be one of the defined vocabulary values
4. `kanton` should be one of the defined vocabulary values if provided
5. `sprachregion` should be one of the defined vocabulary values if provided
6. If `aufloesung_jahr` is provided, it should be later than `gruendungsjahr`

## Research Significance

### Geographic and Institutional Analysis

This entity enables:

1. **Geographic Patterns**: Mapping cases across cantons and language regions
2. **Institutional Types**: Analyzing which types of institutions had more cases
3. **Diocesan Patterns**: Comparing patterns across different dioceses
4. **Historical Context**: Tracking institutions over time, including closures
5. **Cross-Border Transfers**: Detecting movement of accused clergy between jurisdictions

### Language Region Considerations

The `sprachregion` field is important because:
- Different language regions have different clerical title conventions
- Language regions may have different documentation practices
- Cultural differences may affect reporting patterns
- Enables "Trading Zone" analysis (harmonization across language regions)

### Historical Name Tracking

The `name_historisch` field enables:
- Tracking institutions across name changes
- Linking historical records to current institutions
- Understanding institutional continuity or discontinuity

## Notes

- **Historical Names**: Many institutions have changed names over time; tracking this is essential for archival research
- **Dissolved Institutions**: Record dissolution dates for historical institutions that no longer exist
- **Hierarchical Relationships**: Some institutions are nested (e.g., school within parish); document in `traegerschaft` or `anmerkungen`
- **Multi-Site Organizations**: Religious orders may have multiple houses; create separate records for each location

## References

- Controlled Vocabularies: [vocabularies/](vocabularies/)
- Related Entities: [faelle-schema.md](faelle-schema.md), [beschuldigte-schema.md](beschuldigte-schema.md)
- Geographic Data: Consider adding geospatial coordinates for mapping in future versions

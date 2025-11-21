# EDTF (Extended Date/Time Format) Documentation

## Overview

The Extended Date/Time Format (EDTF) is used throughout this research database to represent dates that are uncertain, approximate, partial, or expressed as ranges. This is essential for historical research on sexual abuse cases where:

- Victims may not remember exact dates
- Archival records may be incomplete
- Dates may be deliberately obscured
- Abuse occurred over extended, unclear periods

## EDTF Specification

This database uses **EDTF Level 1** as specified by the Library of Congress:
https://www.loc.gov/standards/datetime/

## Common EDTF Patterns in This Database

### 1. Complete Dates

```
1985-06-15    # June 15, 1985 (complete date)
1985-06       # June 1985 (day unknown)
1985          # Year 1985 (month and day unknown)
```

### 2. Uncertain Dates (?)

Use `?` when the date is uncertain but believed to be correct:

```
1985?         # Possibly 1985
1985-06?      # Possibly June 1985
1985-06-15?   # Possibly June 15, 1985
```

**Example Use Case**: Victim recalls abuse happening "around 1985" but is not certain.

### 3. Approximate Dates (~)

Use `~` when the date is approximate:

```
1985~         # Approximately 1985
1985-06~      # Approximately June 1985
```

**Example Use Case**: Archival document states "mid-1980s" or "around summer 1985."

### 4. Uncertain AND Approximate (%)

Use `%` when a date is both uncertain and approximate:

```
1985%         # Approximately and uncertainly 1985
```

**Example Use Case**: Very vague memory or third-hand information.

### 5. Date Ranges (/)

Use `/` to indicate a range from one date to another:

```
1985/1990              # Period from 1985 to 1990
1985-06/1985-08        # From June 1985 to August 1985
1985/1990~             # From 1985 to approximately 1990
1985?/1990?            # From possibly 1985 to possibly 1990
```

**Example Use Case**: Abuse occurred over a period, e.g., "throughout the late 1980s."

### 6. Open Ranges

```
1985/..       # From 1985 onwards (open end)
../1990       # Until 1990 (open start)
```

**Example Use Case**: "Abuse started in 1985 and may have continued beyond the victim's departure in 1987."

### 7. Decades and Centuries

```
198X          # 1980s (any year in the 1980s)
19XX          # 20th century (any year 1900-1999)
```

Note: This is EDTF Level 2; use with caution and document clearly.

## Fields Using EDTF in This Database

### FALL (Case)
- `meldedatum` - Date case was reported
- `tatzeit_von` - Start of abuse period
- `tatzeit_bis` - End of abuse period

### BETROFFENER (Affected Person)
- `geburtsdatum_edtf` - Date of birth (often approximate for privacy)

### BESCHULDIGTER (Accused Person)
- `geburtsdatum_edtf` - Date of birth
- `weihedatum` - Ordination date (may be uncertain in historical records)

### KIRCHLICHE_INSTITUTION (Church Institution)
- `gruendungsjahr` - Year of foundation
- `aufloesung_jahr` - Year of dissolution

## Practical Examples from Research Context

### Example 1: Victim's Uncertain Memory

**Scenario**: Victim recalls abuse "sometime in the mid-1980s, maybe 1985 or 1986."

```json
{
  "tatzeit_von": "1985~",
  "tatzeit_bis": "1986~"
}
```

### Example 2: Archival Gap

**Scenario**: Church records show a priest was transferred in 1987, but no records explain why. Victim testimony suggests abuse in "the years before the transfer."

```json
{
  "tatzeit_von": "1985/1987",
  "tatzeit_bis": "1987?"
}
```

### Example 3: Approximate Birth Date for Privacy

**Scenario**: To protect privacy, birth date is generalized to early 1960s.

```json
{
  "geburtsdatum_edtf": "1960/1965"
}
```

### Example 4: Historical Institution

**Scenario**: Archival records indicate a parish school was founded "around 1850" and closed "in the late 1970s."

```json
{
  "gruendungsjahr": "1850~",
  "aufloesung_jahr": "197X"
}
```

### Example 5: Ongoing Abuse

**Scenario**: Abuse started in 1982 and continued until victim left the institution; victim is unsure exactly when they left.

```json
{
  "tatzeit_von": "1982",
  "tatzeit_bis": "1985/1987"
}
```

## Privacy Considerations with EDTF

EDTF serves **dual purposes** in this research:

1. **Accuracy**: Honestly represents uncertain or incomplete historical data
2. **Privacy**: Allows generalization of dates to protect individual identities

For example:
- Exact birth date `1965-03-17` could be re-identified when combined with other data
- Approximate birth date `1965~` or `1960/1970` maintains analytical utility while protecting privacy

This is particularly important for **affected persons** (victims) where GDPR/DSGVO requires minimization of identifiable data.

## Implementation Notes

### In Semantic MediaWiki / Cargo

Cargo's `Date` field type can store EDTF strings as text. Queries and sorting may require special handling:

```wikitext
{{#cargo_declare:
_table=Faelle
|tatzeit_von=Date
|tatzeit_bis=Date
}}
```

### In Analysis Scripts

Python libraries for EDTF parsing:
- `edtf` - Python implementation of EDTF
- `python-edtf` - Alternative parser

Example Python usage:

```python
from edtf import parse_edtf

# Parse EDTF date
date_obj = parse_edtf("1985~")

# Check uncertainty
if date_obj.is_uncertain:
    print("Date is uncertain")

# Get range
start, end = date_obj.lower_strict(), date_obj.upper_strict()
```

### Validation

When validating EDTF strings:
1. Use EDTF parser libraries (don't write your own)
2. Document which EDTF level is supported (recommend Level 1)
3. Provide guidance to data entry personnel
4. Consider validation in PageForms templates

## Best Practices for Data Entry

1. **Use the most specific format possible**: If year is known, use `1985` not `198X`
2. **Document reasoning**: In `anmerkungen` fields, explain why date is uncertain/approximate
3. **Prefer ranges over vague terms**: `1985/1987` is better than "mid-1980s" in EDTF field (can note "mid-1980s" in text field)
4. **Consistency**: Use same level of precision for comparable fields
5. **Source criticism**: Less reliable sources → more uncertainty markers

## Comparison with ISO 8601

| Feature | ISO 8601 | EDTF |
|---------|----------|------|
| Exact dates | ✅ `1985-06-15` | ✅ `1985-06-15` |
| Partial dates | ❌ | ✅ `1985-06`, `1985` |
| Uncertainty | ❌ | ✅ `1985?` |
| Approximation | ❌ | ✅ `1985~` |
| Ranges | ✅ `1985-06-15/1985-08-20` | ✅ `1985/1987` |
| Decades | ❌ | ✅ `198X` (Level 2) |

EDTF extends ISO 8601 with features needed for cultural heritage and historical research.

## References

- **EDTF Specification**: https://www.loc.gov/standards/datetime/
- **EDTF on Wikipedia**: https://en.wikipedia.org/wiki/Extended_Date_Time_Format
- **Python EDTF Library**: https://pypi.org/project/edtf/
- **Use in Digital Humanities**: See Dublin Core and Europeana implementations

## Further Reading

- Doerr, M. (2003). The CIDOC Conceptual Reference Model. (Discusses temporal uncertainty in cultural heritage)
- Grossner, K. & Janowicz, K. (2012). "Time and Space in Digital Humanities" (On representing historical time)
- Spatio-Temporal Web Archives Project uses EDTF extensively

## Glossary

- **Uncertain (?)**: The date is questionable but believed to be correct
- **Approximate (~)**: The date is not exact but close
- **Both (%%)**: Combination of uncertain and approximate
- **Range (/)**: Period from start date to end date
- **Open range (..)**: One end of the range is unknown or ongoing
- **Level 1**: Core EDTF features (recommended for this project)
- **Level 2**: Extended features (use sparingly and document)

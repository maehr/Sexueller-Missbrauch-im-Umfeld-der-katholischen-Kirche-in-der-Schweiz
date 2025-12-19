# EDTF (Extended Date/Time Format) Documentation

## Overview

The Extended Date/Time Format (EDTF) is used to represent dates that are uncertain, approximate, partial, or expressed as ranges. This database uses **EDTF Level 1** as specified by the Library of Congress: <https://www.loc.gov/standards/datetime/>

## EDTF Patterns

### Complete Dates

```
1985-06-15    # June 15, 1985
1985-06       # June 1985 (day unknown)
1985          # Year 1985 (month and day unknown)
```

### Uncertain Dates (?)

Use `?` when the date is uncertain but believed to be correct:

```
1985?         # Possibly 1985
1985-06?      # Possibly June 1985
1985-06-15?   # Possibly June 15, 1985
```

### Approximate Dates (~)

Use `~` when the date is approximate:

```
1985~         # Approximately 1985
1985-06~      # Approximately June 1985
```

### Uncertain AND Approximate (%)

Use `%` when a date is both uncertain and approximate:

```
1985%         # Approximately and uncertainly 1985
```

### Date Ranges (/)

Use `/` to indicate a range from one date to another:

```
1985/1990              # Period from 1985 to 1990
1985-06/1985-08        # From June 1985 to August 1985
1985/1990~             # From 1985 to approximately 1990
1985?/1990?            # From possibly 1985 to possibly 1990
```

### Open Ranges

```
1985/..       # From 1985 onwards (open end)
../1990       # Until 1990 (open start)
```

### Decades and Centuries

```
198X          # 1980s (any year in the 1980s)
19XX          # 20th century (any year 1900-1999)
```

Note: This is EDTF Level 2; use with caution and document clearly.

## Comparison with ISO 8601

| Feature       | ISO 8601                   | EDTF                 |
| ------------- | -------------------------- | -------------------- |
| Exact dates   | ✅ `1985-06-15`            | ✅ `1985-06-15`      |
| Partial dates | ❌                         | ✅ `1985-06`, `1985` |
| Uncertainty   | ❌                         | ✅ `1985?`           |
| Approximation | ❌                         | ✅ `1985~`           |
| Ranges        | ✅ `1985-06-15/1985-08-20` | ✅ `1985/1987`       |
| Decades       | ❌                         | ✅ `198X` (Level 2)  |

EDTF extends ISO 8601 with features needed for cultural heritage and historical research.

## References

- **EDTF Specification**: https://www.loc.gov/standards/datetime/
- **EDTF on Wikipedia**: https://en.wikipedia.org/wiki/Extended_Date_Time_Format
- **Python EDTF Library**: https://pypi.org/project/edtf/
- **Use in Digital Humanities**: See Dublin Core and Europeana implementations

## Glossary

- **Uncertain (?)**: The date is questionable but believed to be correct
- **Approximate (~)**: The date is not exact but close
- **Both (%%)**: Combination of uncertain and approximate
- **Range (/)**: Period from start date to end date
- **Open range (..)**: One end of the range is unknown or ongoing
- **Level 1**: Core EDTF features (recommended for this project)
- **Level 2**: Extended features (use sparingly and document)

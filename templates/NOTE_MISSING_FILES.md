# Note: Missing XML Template Files

## Issue

The XML template files referenced in [GitHub Issue #2](https://github.com/maehr/Sexueller-Missbrauch-im-Umfeld-der-katholischen-Kirche-in-der-Schweiz/issues/2) were uploaded as attachments to the issue comment, but the GitHub user-attachment URLs are inaccessible and return "Not Found" errors.

## Files That Should Be Here

Based on the issue comment, the following files should be in this directory:

### Templates (Vorlagen)
1. `Vorlage_Beschuldigter.xml` - Template for accused persons
2. `Vorlage_Betroffener.xml` - Template for affected persons
3. `Vorlage_Fachgremium.xml` - Template for expert committees
4. `Vorlage_Fall.xml` - Template for cases
5. `Vorlage_Kirchliche_Institution.xml` - Template for church institutions
6. `Vorlage_Strafverfolgungsbehorde.xml` - Template for law enforcement authorities

### Forms (Formulare)
7. `Formular_Beschuldigter.xml` - Form for entering accused persons
8. `Formular_Betroffener.xml` - Form for entering affected persons
9. `Formular_Fachgremium.xml` - Form for entering expert committees
10. `Formular_Fall.xml` - Form for entering cases
11. `Formular_Kirchliche_Institution.xml` - Form for entering church institutions
12. `Formular_Strafverfolgungsbehorde.xml` - Form for entering law enforcement authorities

### Categories (Kategorien)
13. `Kategorie_Beschuldigte.xml` - Category with Cargo declaration for accused persons
14. `Kategorie_Betroffene.xml` - Category with Cargo declaration for affected persons
15. `Kategorie_Fachgremien.xml` - Category with Cargo declaration for expert committees
16. `Kategorie_Falle.xml` - Category with Cargo declaration for cases
17. `Kategorie_Kirchliche_Institutionen.xml` - Category with Cargo declaration for church institutions
18. `Kategorie_Strafverfolgungsbehorden.xml` - Category with Cargo declaration for law enforcement authorities

### Other
19. `Fallbeschreibung.xml` - Case description template
20. `Cargo-Tabellendiagramm.pdf` - Cargo table diagram (should be in `data/schemas/`)

## Next Steps

To complete the implementation of Issue #2:

1. **Upload the XML files** to this directory via one of these methods:
   - Direct upload through GitHub web interface
   - Git commit and push
   - Accessible URL (e.g., Dropbox, Google Drive with public link)
   - Attach to a new comment on Issue #2 (but note: same access issue may occur)

2. **Verify alignment** with schema definitions in `data/schemas/`:
   - Field names match
   - Data types match
   - Controlled vocabularies are consistent
   - Cargo table declarations match schema definitions

3. **Test in MediaWiki**:
   - Import XML files into a test MediaWiki instance
   - Create Cargo tables
   - Test data entry forms
   - Verify template display
   - Test queries and relationships

4. **Document any deviations**:
   - If actual templates differ from schemas, update schemas
   - If schemas are authoritative, update templates
   - Document the source of truth

## Temporary Workaround

In the meantime, the comprehensive schema documentation in `data/schemas/` provides:
- Entity definitions
- Field specifications
- Controlled vocabularies
- Cargo table declarations
- Example records

These can be used to:
1. Understand the data model
2. Create new templates from scratch if needed
3. Validate any templates once they become available

## Contact

If you have access to these files, please:
- Upload them to this directory
- Or provide an accessible download link
- Or contact the repository maintainers

## GitHub User-Attachments Issue

GitHub user-attachment URLs in issue comments are:
- Not permanent
- May require authentication
- Not designed for long-term file hosting

For permanent file storage in repositories, files should be:
- Committed directly to the repository
- Or stored in a release
- Or hosted on a permanent file hosting service with public links

## Status

- [x] Directory structure created
- [x] Comprehensive schema documentation created
- [x] Controlled vocabularies created
- [x] README and guides created
- [ ] **XML template files pending** (waiting for accessible upload)
- [ ] Testing in MediaWiki pending
- [ ] Final validation pending

Last updated: 2024-11-21

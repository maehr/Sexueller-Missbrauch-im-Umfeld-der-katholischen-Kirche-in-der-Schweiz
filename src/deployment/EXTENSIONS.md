# MediaWiki Extensions Configuration

This document describes the configuration and usage of key MediaWiki extensions in this project, specifically **Cargo** and **Page Forms**.

## Cargo Extension

[Cargo](https://www.mediawiki.org/wiki/Extension:Cargo) provides a way to store, query, and format data defined within wiki pages, turning the wiki into a structured database.

### Configuration

The extension is loaded in `LocalSettings.php`. Key configurations include:

- Loading the `Cargo` extension.
- Database configuration using environment variables.
- Cache settings optimized for research data entry (caching disabled).

### Usage

Cargo is used for structured data storage, complex queries, and integration with PageForms.

- **Tables** are declared using `#cargo_declare` in the `Category:` namespace.
- **Queries** are performed using `#cargo_query` to generate reports.

For actual implementation, see the [Data Schemas](../../data/index.qmd).

### Troubleshooting

If Cargo tables are not being created:

1. Check `LocalSettings.php`.
2. Verify database permissions.
3. Run the update script: `docker-compose exec mediawiki php maintenance/update.php --quick`
4. Check MediaWiki logs.

## Page Forms Extension

[Page Forms](https://www.mediawiki.org/wiki/Extension:Page_Forms) allows users to create and edit wiki pages using forms, providing a structured data entry interface.

### Configuration

The extension is loaded in `LocalSettings.php`. Key configurations include:

- Loading `PageForms` and `PageSchemas`.
- Enabling file uploads and allowed extensions.
- Integration with `VisualEditor`.

### Usage

PageForms is used for structured data entry, validation, and template integration.

- **Forms** are defined in the `Form:` namespace.
- **Templates** in the `Template:` namespace use `#cargo_store` to save form data into Cargo tables.

For actual implementation, see the [Data Templates](../../data/index.qmd).

### Permissions

Form editing respects MediaWiki permissions defined in `LocalSettings.php`.

### Troubleshooting

If forms are not appearing:

1. Verify extension loading.
2. Check namespaces (`Form:`, `Template:`).
3. Check browser console for JS errors.

If data is not stored in Cargo:

1. Verify `#cargo_store` in templates.
2. Recreate Cargo tables: `php extensions/Cargo/maintenance/cargoRecreateData.php --table=TableName`
3. Run update script.

## Maintenance Tasks

### Recreating Forms/Tables

When changing structure:

```bash
# Update MediaWiki
docker-compose exec mediawiki php maintenance/update.php --quick

# Recreate Cargo tables
docker-compose exec mediawiki php extensions/Cargo/maintenance/cargoRecreateData.php --table=TableName

# Process job queue
docker-compose exec mediawiki php maintenance/runJobs.php --maxjobs=1000
```

## References

- [Cargo Documentation](https://www.mediawiki.org/wiki/Extension:Cargo)
- [Page Forms Documentation](https://www.mediawiki.org/wiki/Extension:Page_Forms)

# Cargo Extension Configuration

This document describes how the [Cargo extension](https://www.mediawiki.org/wiki/Extension:Cargo) is configured in this MediaWiki instance.

## Overview

Cargo is a MediaWiki extension that provides a way to store, query, and format data that is defined within wiki pages. It allows you to turn your wiki into a structured database that can be queried like a relational database.

## Installation

The Cargo extension is installed automatically in the Docker image. See the `Dockerfile`:

```dockerfile
# Clone and set up the Cargo extension
RUN git clone -b REL1_43 https://gerrit.wikimedia.org/r/mediawiki/extensions/Cargo /var/www/html/extensions/Cargo
```

## Configuration in LocalSettings.php

### Basic Extension Loading

The extension is loaded in `LocalSettings.php` with the following line:

```php
wfLoadExtension( 'Cargo' );
```

### Database Configuration

Cargo uses the same database configuration as MediaWiki:

```php
$wgDBtype = 'mysql';
$wgDBserver = getenv('MW_DB_SERVER') ?: 'db';
$wgDBname = getenv('MW_DB_NAME') ?: 'my_wiki';
$wgDBuser = getenv('MW_DB_USER') ?: 'wikiuser';
$wgDBpassword = getenv('MW_DB_PASSWORD') ?: 'wikipassword';
```

### Cache Settings

For this research project, caching is disabled to ensure data consistency during development and data entry:

```php
$wgCachePages = false;
$wgEnableParserCache = false;
$wgParserCacheType = CACHE_NONE;
$wgUseFileCache = false;
```

**Note**: This setting ensures that changes to Cargo tables and queries are immediately reflected without cache invalidation issues. This is particularly important during the active data collection and entry phase. In a production environment with stable data and high traffic, you may want to enable caching for better performance, though this requires careful cache invalidation when data changes.

## Usage in This Project

Cargo is used extensively in this project for:

1. **Structured Data Storage**: Storing research data about persons, institutions, events, and sources
2. **Data Queries**: Querying the database to generate reports and visualizations
3. **Forms Integration**: Working with PageForms to provide structured data entry interfaces

### Example Cargo Table Declaration

In wiki pages, Cargo tables are declared using the `#cargo_declare` parser function:

```mediawiki
{{#cargo_declare:
  _table=Persons
  |PersonID=String
  |FirstName=String
  |LastName=String
  |DateOfBirth=Date
  |Institution=Page
}}
```

### Example Cargo Query

Data can be queried using the `#cargo_query` parser function:

```mediawiki
{{#cargo_query:
  tables=Persons
  |fields=FirstName, LastName, DateOfBirth
  |where=Institution='Diocese of Basel'
  |order by=LastName
}}
```

## Database Maintenance

After making changes to Cargo table structures, you need to recreate the tables:

```bash
# Update database schema
docker exec mediawiki php maintenance/update.php --quick

# Recreate Cargo tables
docker exec mediawiki php extensions/Cargo/maintenance/cargoRecreateData.php --table=TableName
```

## Advanced Configuration Options

The following configuration options are available but not currently used in this project:

- `$wgCargoDecimalMark` - Set decimal mark (default is '.')
- `$wgCargoDigitGroupingCharacter` - Set digit grouping character (default is ',')
- `$wgCargoRecurringEventMaxInstances` - Maximum instances for recurring events (default is 100)
- `$wgCargoDBtype` - Database type (defaults to `$wgDBtype`)
- `$wgCargoDBserver` - Database server (defaults to `$wgDBserver`)
- `$wgCargoDBname` - Database name (defaults to `$wgDBname`)
- `$wgCargoDBuser` - Database user (defaults to `$wgDBuser`)
- `$wgCargoDBpassword` - Database password (defaults to `$wgDBpassword`)

## Troubleshooting

### Cargo Tables Not Created

If Cargo tables are not being created:

1. Check that the extension is properly loaded in LocalSettings.php
2. Verify database permissions
3. Run the update script: `docker exec mediawiki php maintenance/update.php --quick`
4. Check the MediaWiki logs for error messages

### Query Performance Issues

If Cargo queries are slow:

1. Check database indexes
2. Consider enabling caching (if appropriate for your use case)
3. Optimize your queries (use specific fields instead of `*`)
4. Review the query execution plan

## References

- [Cargo Extension Documentation](https://www.mediawiki.org/wiki/Extension:Cargo)
- [Cargo Tables](https://www.mediawiki.org/wiki/Extension:Cargo/Storing_data)
- [Cargo Queries](https://www.mediawiki.org/wiki/Extension:Cargo/Querying_data)
- [Cargo Formats](https://www.mediawiki.org/wiki/Extension:Cargo/Query_formats)

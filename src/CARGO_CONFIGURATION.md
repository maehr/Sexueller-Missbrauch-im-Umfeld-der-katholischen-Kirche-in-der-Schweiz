# Cargo Extension Configuration

This document describes how the [Cargo extension](https://www.mediawiki.org/wiki/Extension:Cargo) is configured in this MediaWiki instance.

## Overview

Cargo is a MediaWiki extension that provides a way to store, query, and format data that is defined within wiki pages. It allows you to turn your wiki into a structured database that can be queried like a relational database.

## Installation

The Cargo extension is installed automatically in the Docker image. See the [**Dockerfile**](Dockerfile) for details.

## Configuration

The extension is loaded and configured in [**LocalSettings.php**](LocalSettings.php). Key configurations include:

- Loading the `Cargo` extension.
- Database configuration using environment variables.
- Cache settings optimized for research data entry (caching disabled).

## Usage in This Project

Cargo is used for structured data storage, complex queries, and integration with PageForms.

### Example Cargo Table Declaration

Tables are declared using `#cargo_declare` in the `Category:` namespace.

### Example Cargo Query

Data is queried using `#cargo_query` to generate reports and visualizations.

For the actual implementation of Cargo tables used in this project, see the [**Data Schemas**](../data/schemas/index.qmd).

## Database Maintenance

After making changes to Cargo table structures, you need to recreate the tables. See the [**Maintenance section in DEPLOYMENT.qmd**](DEPLOYMENT.qmd#monitoring-and-maintenance) for details.

## Troubleshooting

### Cargo Tables Not Created

If Cargo tables are not being created:

1. Check that the extension is properly loaded in LocalSettings.php
2. Verify database permissions
3. Run the update script: `docker-compose -f docker-compose.dev.yml exec mediawiki php maintenance/update.php --quick`
4. Check the MediaWiki logs for error messages

## References

- [Cargo Extension Documentation](https://www.mediawiki.org/wiki/Extension:Cargo)
- [Cargo Tables](https://www.mediawiki.org/wiki/Extension:Cargo/Storing_data)
- [Cargo Queries](https://www.mediawiki.org/wiki/Extension:Cargo/Querying_data)
- [Cargo Formats](https://www.mediawiki.org/wiki/Extension:Cargo/Query_formats)

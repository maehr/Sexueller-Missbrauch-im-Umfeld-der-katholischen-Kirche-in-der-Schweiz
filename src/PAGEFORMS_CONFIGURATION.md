# PageForms Extension Configuration

This document describes how the [Page Forms extension](https://www.mediawiki.org/wiki/Extension:Page_Forms) is configured in this MediaWiki instance.

## Overview

Page Forms is a MediaWiki extension that allows users to create and edit wiki pages using forms, providing a structured data entry interface. It works seamlessly with Cargo to provide a complete data management solution.

## Installation

The PageForms extension is installed automatically in the Docker image. See the [**Dockerfile**](Dockerfile) for details.

## Configuration

The extension is loaded and configured in [**LocalSettings.php**](LocalSettings.php). Key configurations include:

- Loading `PageForms` and `PageSchemas` extensions.
- Enabling file uploads and defining allowed extensions.
- Integration with `VisualEditor`.

## Usage in This Project

PageForms is used extensively for structured data entry, validation, and template integration.

### Example Form Definition

Forms are defined in the `Form:` namespace. They define the layout and fields for data entry.

### Example Template with Cargo

Templates in the `Template:` namespace use `#cargo_store` to save form data into Cargo tables.

For the actual implementation of forms and templates used in this project, see the [**Data Templates**](../data/templates/index.qmd).

## Form Input Types

PageForms supports various input types:

- `text` - Simple text input
- `textarea` - Multi-line text input
- `datepicker` - Date selection with calendar
- `combobox` - Autocomplete dropdown
- `dropdown` - Standard dropdown menu
- `checkbox` - Checkbox input
- `radiobutton` - Radio button selection
- `tokens` - Tag-style multiple selection
- `tree` - Hierarchical selection

## Permissions and Access Control

Form editing respects MediaWiki permissions:

```php
# Permissions for the various user groups
$wgGroupPermissions['*']['createaccount'] = false;
$wgGroupPermissions['*']['edit'] = false;
$wgGroupPermissions['*']['read'] = false;
$wgGroupPermissions['autoconfirmed']['upload'] = true;
$wgGroupPermissions['user']['upload'] = true;
$wgGroupPermissions['*']['upload'] = false;

# Template namespace protection
$wgNamespaceProtection[NS_TEMPLATE] = [ 'edittemplates' ];
$wgGroupPermissions['sysop']['edittemplates'] = true;
```

## Advanced Configuration Options

The following configuration options are available but not currently used in this project:

```php
// Set the maximum number of values for a field (default: 100)
// $wgPageFormsMaxAutocompleteValues = 100;

// Enable linking to redlink pages in autocompletion (default: false)
// $wgPageFormsAutocompleteOnAllChars = false;

// Set the cache type for autocompletion (default: $wgMainCacheType)
// $wgPageFormsCacheAutocompleteValues = CACHE_ANYTHING;

// Enable use of placeholder text in form fields
// $wgPageFormsUseDisplayTitle = false;
```

## Troubleshooting

### Forms Not Appearing

If forms are not appearing or not working:

1. Verify the extension is loaded in LocalSettings.php
2. Check that form pages are in the correct namespace (Form:)
3. Verify template pages are in the Template namespace
4. Check for JavaScript errors in browser console

### Autocompletion Not Working

If autocompletion is not working:

1. Verify the `values from namespace` or `values from category` parameters
2. Check that the target pages exist
3. Clear browser cache
4. Check MediaWiki cache settings

### Data Not Being Stored in Cargo

If form data is not being stored in Cargo tables:

1. Verify the template includes `#cargo_store` calls
2. Check that Cargo tables are created: `php extensions/Cargo/maintenance/cargoRecreateData.php --table=TableName`
3. Run update script: `php maintenance/update.php --quick`
4. Check error logs

## Maintenance Tasks

### Recreating Forms After Schema Changes

When you change the structure of forms or templates:

```bash
# Update MediaWiki
docker-compose -f docker-compose.dev.yml exec mediawiki php maintenance/update.php --quick

# Recreate Cargo tables if using Cargo
docker-compose -f docker-compose.dev.yml exec mediawiki php extensions/Cargo/maintenance/cargoRecreateData.php --table=TableName

# Process job queue
docker-compose -f docker-compose.dev.yml exec mediawiki php maintenance/runJobs.php --maxjobs=1000
```

### Batch Editing Pages

To apply form/template changes to existing pages:

1. Use the Special:ReplaceText page (requires ReplaceText extension)
2. Or use the DataTransfer extension for batch imports/exports

## References

- [Page Forms Documentation](https://www.mediawiki.org/wiki/Extension:Page_Forms)
- [Page Forms Examples](https://www.mediawiki.org/wiki/Extension:Page_Forms/Examples)
- [Page Forms Input Types](https://www.mediawiki.org/wiki/Extension:Page_Forms/Input_types)
- [Page Schemas Documentation](https://www.mediawiki.org/wiki/Extension:Page_Schemas)
- [Integration with Cargo](https://www.mediawiki.org/wiki/Extension:Page_Forms/Linking_to_forms#Linking_from_Cargo)

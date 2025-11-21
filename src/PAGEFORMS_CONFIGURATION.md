# PageForms Extension Configuration

This document describes how the [Page Forms extension](https://www.mediawiki.org/wiki/Extension:Page_Forms) (formerly known as Semantic Forms) is configured in this MediaWiki instance.

## Overview

Page Forms is a MediaWiki extension that allows users to create and edit wiki pages using forms, providing a structured data entry interface. It works seamlessly with Cargo to provide a complete data management solution.

## Installation

The PageForms extension is installed automatically in the Docker image. See the `Dockerfile`:

```dockerfile
# Clone and set up the Page Forms extension
RUN git clone -b REL1_43 https://gerrit.wikimedia.org/r/mediawiki/extensions/PageForms /var/www/html/extensions/PageForms

# Also install related extensions
RUN git clone -b REL1_43 https://gerrit.wikimedia.org/r/mediawiki/extensions/PageSchemas /var/www/html/extensions/PageSchemas
```

## Configuration in LocalSettings.php

### Basic Extension Loading

The extension is loaded in `LocalSettings.php` with the following lines:

```php
wfLoadExtension( 'PageForms' );
wfLoadExtension( 'PageSchemas' );  // Recommended companion extension
```

### Related Extensions

PageForms works best with these companion extensions (all included in our setup):

```php
wfLoadExtension( 'Cargo' );         // For structured data storage
wfLoadExtension( 'DataTransfer' );  // For data import/export
wfLoadExtension( 'PageSchemas' );   // For schema definitions
```

### File Upload Configuration

Forms often include file upload fields. The following settings enable file uploads:

```php
$wgEnableUploads = true;
$wgMaxUploadSize = 1024 * 1024 * 50; // Set upload limit to 50MB
$wgUseImageMagick = true;
$wgImageMagickConvertCommand = '/usr/bin/convert';

// Allowed file extensions
$wgFileExtensions = [
    'png', 'gif', 'jpg', 'jpeg',
    'doc', 'xls', 'mpp', 'pdf', 'ppt',
    'tiff', 'bmp', 'docx', 'xlsx', 'pptx',
    'ps', 'odt', 'ods', 'odp', 'odg',
    'csv', 'tsv'
];
```

### Visual Editor Integration

PageForms works with VisualEditor for a better editing experience:

```php
wfLoadExtension( 'VisualEditor' );
```

## Usage in This Project

PageForms is used extensively in this project for:

1. **Structured Data Entry**: Providing user-friendly forms for entering research data
2. **Data Validation**: Ensuring data consistency through form field validation
3. **Template Integration**: Working with MediaWiki templates to structure page content
4. **Cargo Integration**: Automatically storing form data in Cargo tables

### Example Form Definition

Forms are defined in the Template namespace. Example form structure:

```mediawiki
<noinclude>
This is the 'Person' form.
To create a page with this form, enter the page name below;
if a page with that name already exists, you will be sent to a form to edit that page.

{{#forminput:form=Person}}
</noinclude><includeonly>
{{{info|page name=<Person[LastName]>, <Person[FirstName]>}}}

{{{for template|Person}}}
'''First Name:'''
{{{field|FirstName|mandatory}}}

'''Last Name:'''
{{{field|LastName|mandatory}}}

'''Date of Birth:'''
{{{field|DateOfBirth|input type=datepicker}}}

'''Institution:'''
{{{field|Institution|input type=combobox|values from namespace=Institution}}}

'''Notes:'''
{{{field|Notes|input type=textarea|rows=5}}}

{{{end template}}}

{{{standard input|save}}} {{{standard input|cancel}}}
</includeonly>
```

### Example Template with Cargo

Templates store data in Cargo tables:

```mediawiki
<noinclude>
This is the 'Person' template.
It should be called in the following format:
<pre>
{{Person
|FirstName=
|LastName=
|DateOfBirth=
|Institution=
|Notes=
}}
</pre>
</noinclude><includeonly>
{{#cargo_store:
_table=Persons
|PersonID={{{LastName}}}, {{{FirstName}}}
|FirstName={{{FirstName|}}}
|LastName={{{LastName|}}}
|DateOfBirth={{{DateOfBirth|}}}
|Institution={{{Institution|}}}
|Notes={{{Notes|}}}
}}

== Person Information ==
* '''Name:''' {{{FirstName}}} {{{LastName}}}
* '''Date of Birth:''' {{{DateOfBirth}}}
* '''Institution:''' [[{{{Institution}}}]]
* '''Notes:''' {{{Notes}}}

[[Category:Person]]
</includeonly>
```

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
docker exec mediawiki php maintenance/update.php --quick

# Recreate Cargo tables
docker exec mediawiki php extensions/Cargo/maintenance/cargoRecreateData.php --table=TableName

# Run pending jobs
docker exec mediawiki php maintenance/runJobs.php --maxjobs=1000
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

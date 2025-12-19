FROM mediawiki:1.43.1

# Install necessary packages
RUN echo "deb https://deb.debian.org/debian/ bookworm main contrib non-free" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends git openssl htmldoc && \
    rm -rf /var/lib/apt/lists/*

# Clone and set up the Cargo extension
RUN git clone -b REL1_43 https://gerrit.wikimedia.org/r/mediawiki/extensions/Cargo /var/www/html/extensions/Cargo

# Clone and set up the Data Transfer extension
RUN git clone -b REL1_43 https://gerrit.wikimedia.org/r/mediawiki/extensions/DataTransfer /var/www/html/extensions/DataTransfer

# Clone and set up the Page Forms extension
RUN git clone -b REL1_43 https://gerrit.wikimedia.org/r/mediawiki/extensions/PageForms /var/www/html/extensions/PageForms

# Clone and set up the Page Schemas extension
RUN git clone -b REL1_43 https://gerrit.wikimedia.org/r/mediawiki/extensions/PageSchemas /var/www/html/extensions/PageSchemas

# Clone and set up the PdfBook extension
RUN git clone https://github.com/debtcompliance/PdfBook/ /var/www/html/extensions/PdfBook

# Copy the UZH logo and set permissions
COPY src/assets/uzh-logo.svg /var/www/html/resources/assets/uzh-logo.svg
RUN chown www-data:www-data /var/www/html/resources/assets/uzh-logo.svg

# Set correct permissions for the extensions and certificates
RUN chown -R www-data:www-data /var/www/html/extensions

# Set PHP file upload limits
RUN echo "upload_max_filesize = 50M\npost_max_size = 50M" > /usr/local/etc/php/conf.d/uploads.ini

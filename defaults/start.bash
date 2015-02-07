#!/bin/bash

#
# start.bash
#

set -e

# Make sure Apache is handled
rm -f /var/run/apache2/apache2.pid

# Initialize variables
FLYSPRAY="/tmp/flyspray"
HTML="/var/www/html"

cd "$FLYSPRAY"

# Copy flyspray files to /var/www/html if /var/www/html does NOT exist
if [ -d "$HTML" ]
then
	echo "The /var/www/html directory already exists. Flyspray not copied from /tmp/flyspray"
else
	echo "/var/www/html does NOT exist."
	echo "Making directory /var/www/html"
	mkdir -p "$HTML"
	echo "Copying flyspray from /tmp/flyspray to /var/www/html"
	cp -fr * "$HTML"
	chown -R www-data:www-data "$HTML"
	chmod -R 644 "$HTML"
fi

# Start Apache2
echo "Starting Apache2"
exec apache2 -DFOREGROUND
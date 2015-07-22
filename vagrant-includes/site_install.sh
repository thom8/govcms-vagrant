#!/bin/bash

dbName="$1"
siteName="$2"
drupalUser="$3"
drupalPass="$4"

if [ ! -f /home/vagrant/siteinstalled ] ; then

  # Build govCMS.
  composer install --prefer-dist --working-dir=/drupal/build 2>&1

  /drupal/build/bin/phing \
  -Ddb.name="${dbName}" \
  -Dsite.name="${siteName}" \
  -Daccount.name="${drupalUser}" \
  -Daccount.password="${drupalPass}" \
  -f /drupal/build/phing/build.xml build:local 2>&1

  # Create siteinstalled file.
  touch /home/vagrant/siteinstalled

fi
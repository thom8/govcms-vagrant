#!/bin/bash

if [ ! -f ~/siteinstalled ] ; then

  # Build govCMS.
  composer install --prefer-dist --working-dir=/drupal/build 2>&1
  /drupal/build/bin/phing -f /drupal/build/phing/build.xml build 2>&1

  # Create siteinstalled file.
  touch ~/siteinstalled

fi
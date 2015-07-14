#!/bin/bash

dbName="$1"
siteName="$2"
drupalUser="$3"
drupalPass="$4"

if [ ! -f siteinstalled ] ; then

  # Download Drupal 7
  if [ ! -f /drupal/install.php ] ; then
  echo "Downloading Drupal core..."
    drush dl drupal -y -q \
    --destination="/tmp/drush" \
    --default-major=7 \
    --drupal-project-rename="drupal"

    # Copy to docroot
    cp -a /tmp/drush/drupal/. /drupal

    # Create files directory
    mkdir -p /drupal/sites/default/files
    chmod -R 775 /drupal/sites/default/files
  fi

  # Download govcms profile
  if [ ! -d /drupal/profiles/govcms ] ; then
  echo "Downloading govCMS profile..."
    drush --root=/drupal dl govcms -y -q
  fi

  echo "Starting Drupal installation. This takes a few mins."

  # Tidy up
  drush --root=/drupal sql-drop -y -q
  sudo chmod 775 /drupal/sites/default/ >/dev/null
  sudo rm -rf /drupal/sites/default/settings.php >/dev/null

  # Install Drupal
  drush --root=/drupal si govcms -y -q \
  --db-url="mysql://root:root@localhost:3306/$dbName" \
  --account-name="$drupalUser" \
  --account-pass="$drupalPass" \
  --site-name="$siteName" \
  install_configure_form.update_status_module='array(FALSE,FALSE)'&>/dev/null


  echo "Install complete."

  # Create dbimported file.
  touch siteinstalled

fi
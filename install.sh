#!/bin/bash

# Clone repo.
git clone --recursive https://github.com/thom8/govcms-vagrant.git govCMS

# cd to project dir.
cd govCMS

# Install vagrant-hostupdater plugin
if !(vagrant plugin list | grep -q vagrant-hostsupdater); then
  vagrant plugin install vagrant-hostupdater
fi

# Vagrant Up!
vagrant up

# Set drush alias.
if which drush >/dev/null; then
  drush site-set @govcms.local
fi

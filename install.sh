#!/bin/bash

# Check vagrant is installed
if ! which vagrant >/dev/null; then
  echo "You need to install vagrant. -- http://www.vagrantup.com/downloads.html"
  exit 1;
fi

# Check virtualbox is installed
if ! which vboxManage >/dev/null; then
  echo "You need to install virtualbox. -- https://www.virtualbox.org/wiki/Downloads"
  exit 1;
fi

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
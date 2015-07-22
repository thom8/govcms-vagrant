#!/bin/bash

vagrant ssh -c "sudo rm -rf /home/vagrant/siteinstalled"
vagrant provision

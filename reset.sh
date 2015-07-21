#!/bin/bash

vagrant ssh -c "sudo rm -rf ~/siteinstalled"
vagrant provision

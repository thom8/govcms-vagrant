# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  require 'yaml'
  if File.exist?('./config.yml')
    # Load config.yml
    vconfig = YAML::load_file("./config.yml")
    # Set base box.
    config.vm.box = vconfig['vagrant_box']
  end

  # Upload behat.local.yml
  config.vm.provision "behat_settings", type: "file" do |s|
   s.source = "./vagrant-includes/behat.local.yml"
   s.destination = "/drupal/build/tests/behat/behat.local.yml"
  end

end

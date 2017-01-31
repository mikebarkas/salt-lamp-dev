# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider :virtualbox do |vb|
      vb.memory = 1024
  end

  config.vm.define :master do |master_config|
    master_config.vm.box = 'ubuntu/trusty64'
    master_config.vm.host_name = 'saltmaster.local'
    master_config.vm.network 'private_network', ip: '192.168.10.10'
    master_config.vm.network 'forwarded_port', id: 'ssh', guest: 22, host: 2220
    master_config.vm.synced_folder 'saltstack/salt/', '/srv/salt'
    master_config.vm.synced_folder 'saltstack/pillar/', '/srv/pillar'

    master_config.vm.provision :salt do |salt|
      salt.master_config = 'saltstack/etc/master'
      salt.master_key = 'saltstack/keys/master.pem'
      salt.master_pub = 'saltstack/keys/master.pub'
      salt.minion_key = 'saltstack/keys/master.pem'
      salt.minion_pub = 'saltstack/keys/master.pub'

      salt.seed_master = {
        'web1' => 'saltstack/keys/web1.pub',
        'db1' => 'saltstack/keys/db1.pub'
      }

      salt.install_type = 'stable'
      salt.install_master = true
      salt.no_minion = true
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = '-P'
    end
  end

  config.vm.define :web1 do |minion_config|
    minion_config.vm.box = 'ubuntu/trusty64'
    minion_config.vm.host_name = 'saltweb1.local'
    minion_config.vm.network 'private_network', ip: '192.168.10.11'
    minion_config.vm.network 'forwarded_port',id: 'ssh', guest: 22, host: 2221

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = 'saltstack/etc/web1'
      salt.minion_key = 'saltstack/keys/web1.pem'
      salt.minion_pub = 'saltstack/keys/web1.pub'
      salt.install_type = 'stable'
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = '-P -c /tmp'
    end
  end

end

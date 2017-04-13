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
    master_config.vm.host_name = 'master.salt'
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
        'web2' => 'saltstack/keys/web2.pub',
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
    minion_config.vm.host_name = 'web1.salt'
    minion_config.vm.network 'private_network', ip: '192.168.10.11'
    minion_config.vm.network 'forwarded_port',id: 'ssh', guest: 22, host: 2221
    minion_config.vm.synced_folder '/host/project/path', '/var/www/projects'

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

  config.vm.define :web2 do |minion_config|
    minion_config.vm.box = 'ubuntu/trusty64'
    minion_config.vm.host_name = 'web2.salt'
    minion_config.vm.network 'private_network', ip: '192.168.10.12'
    minion_config.vm.network 'forwarded_port',id: 'ssh', guest: 22, host: 2222
    minion_config.vm.synced_folder '/host/project/path', '/var/www/projects'

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = 'saltstack/etc/web2'
      salt.minion_key = 'saltstack/keys/web2.pem'
      salt.minion_pub = 'saltstack/keys/web2.pub'
      salt.install_type = 'stable'
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = '-P -c /tmp'
    end
  end

  config.vm.define :web3 do |minion_config|
    minion_config.vm.box = 'ubuntu/precise64'
    minion_config.vm.host_name = 'web3.salt'
    minion_config.vm.network 'private_network', ip: '192.168.10.13'
    minion_config.vm.network 'forwarded_port',id: 'ssh', guest: 22, host: 2223
    minion_config.vm.synced_folder '/host/project/path', '/var/www/projects'

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = 'saltstack/etc/web3'
      salt.minion_key = 'saltstack/keys/web3.pem'
      salt.minion_pub = 'saltstack/keys/web3.pub'
      salt.install_type = 'stable'
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = '-P -c /tmp'
    end
  end

  config.vm.define :db1 do |minion_config|
    minion_config.vm.box = 'ubuntu/trusty64'
    minion_config.vm.host_name = 'db1.salt'
    minion_config.vm.network 'private_network', ip: '192.168.10.20'
    minion_config.vm.network 'forwarded_port',id: 'ssh', guest: 22, host: 2224

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = 'saltstack/etc/db1'
      salt.minion_key = 'saltstack/keys/db1.pem'
      salt.minion_pub = 'saltstack/keys/db1.pub'
      salt.install_type = 'stable'
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = '-P -c /tmp'
    end
  end

  config.vm.define :db2 do |minion_config|
    minion_config.vm.box = 'ubuntu/precise64'
    minion_config.vm.host_name = 'db2.salt'
    minion_config.vm.network 'private_network', ip: '192.168.10.21'
    minion_config.vm.network 'forwarded_port',id: 'ssh', guest: 22, host: 2225

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = 'saltstack/etc/db2'
      salt.minion_key = 'saltstack/keys/db2.pem'
      salt.minion_pub = 'saltstack/keys/db2.pub'
      salt.install_type = 'stable'
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = '-P -c /tmp'
    end
  end

end

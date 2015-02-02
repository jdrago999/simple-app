VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.hostname = 'api-example'
  config.vm.network "private_network", ip: "192.168.33.11"
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
  config.vm.synced_folder "./", "/var/www/app"

  vagrant_json = JSON.parse(Pathname(__FILE__).dirname.join('chef', 'node.json').read)

  config.omnibus.chef_version = :latest
  config.librarian_chef.cheffile_dir = "chef"
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = ['chef/cookbooks', 'chef/site-cookbooks']
    chef.run_list = vagrant_json.delete('run_list')
    chef.json = vagrant_json
  end

end

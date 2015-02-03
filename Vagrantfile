VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  # If this Vagrantfile is in /foo/bar/baz then set the hostname to 'baz':
  app_name = File.split(Dir.getwd)[-1]
  config.vm.hostname = app_name
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.vm.network "private_network", type: :dhcp
  config.hostmanager.ip_resolver = proc do |vm, resolving_vm|
    if vm.id
      `VBoxManage guestproperty get #{vm.id} "/VirtualBox/GuestInfo/Net/1/V4/IP"`.split()[1]
    end
  end

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
  config.vm.synced_folder "./", "/var/www/#{app_name}"

  vagrant_json = JSON.parse(Pathname(__FILE__).dirname.join('chef', 'node.json').read)

  config.omnibus.chef_version = :latest
  config.librarian_chef.cheffile_dir = "chef"
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = 'chef/cookbooks'
    chef.run_list = vagrant_json.delete('run_list')
    chef.json = vagrant_json
  end

  # Force install the latest cookbooks from source:
  `cd chef && librarian-chef install && librarian-chef update`
end

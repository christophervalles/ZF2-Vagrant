Vagrant::Config.run do |config|
  # Configure the shared folders here
  config.vm.share_folder "zf2-api", "/var/source-api", "~/Dropbox/ZF\ Book/source-api"
  config.vm.share_folder "zf2-client", "/var/source-client", "~/Dropbox/ZF\ Book/source-client"
  
  # Configuration of the VM settings
  config.vm.box = "ubuntu-12.04"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.customize ["modifyvm", :id, "--memory", 1024]
  
  # Configuration of the network settings
  config.vm.host_name = "zf2-server"
  config.vm.network :hostonly, "192.168.56.2"
  
  # Configuration of the recipes
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "./cookbooks"
    
    chef.add_recipe "apt"
    chef.add_recipe "mysql::server"
    chef.add_recipe "nginx"
    chef.add_recipe "custom::vhosts"
    chef.add_recipe "php-fpm"
    chef.add_recipe "php::module_apc"
    chef.add_recipe "php::module_curl"
    chef.add_recipe "php::module_gd"
    chef.add_recipe "php::module_mysql"
    chef.add_recipe "postfix"
    chef.add_recipe "custom::db"
    chef.add_recipe "custom::hosts"
    
    # MySQL and Nginx configurations
    chef.json = {
      :mysql => {
        :server_root_password => "root",
        :server_repl_password => "repl",
        :server_debian_password => "debian",
        :allow_remote_root => true,
        :use_upstart => false
      },
      :cloud => {
        :local_ipv4 => '0.0.0.0'
      },
      :nginx => {
        :default_site_enabled => false
      },
    }
  end
end
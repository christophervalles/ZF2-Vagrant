Vagrant::Config.run do |config|
  # CONFIGURA AQUI LAS CARPETAS COMPARTIDAS, AÑADE TANTAS COMO NECESITES
  # El primer parametro es un nombre descriptivo (Sin espacios)
  # El segundo es la ruta que va a tener dentro de la VM
  # El tercero es la ruta a la carpeta en tu local
  config.vm.share_folder "zf2", "/var/source", "~/ZF\ Book/source"
  
  # NO TOQUES NADA DE LO QUE SALE DEBAJO
  
  config.vm.box = "ubuntu-12.04"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :bridged
  config.vm.customize ["modifyvm", :id, "--memory", 1024]
  config.vm.host_name = "zf2-server"
  
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "./cookbooks"
    
    chef.add_recipe "apt"
    chef.add_recipe "mysql::server"
    chef.add_recipe "nginx"
    chef.add_recipe "nginx::vhosts"
    chef.add_recipe "php"
    chef.add_recipe "php-fpm"
    chef.add_recipe "php::module_apc"
    chef.add_recipe "php::module_curl"
    chef.add_recipe "php::module_gd"
    chef.add_recipe "php::module_mysql"
    chef.add_recipe "main"
    
    # You may also specify custom JSON attributes:
    chef.json = {
      :mysql => {
        :server_root_password => "root",
        :server_repl_password => "repl",
        :server_debian_password => "debian"
      },
      :nginx => {
        :sites => [
          {
            :root_path => "/var/source/public",
            :hostname => "zf2"
          }
        ],
        :default_site_enabled => false
      }
    }
  end
end
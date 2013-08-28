# Create db
execute "Create database" do
  command "mysql -uroot -proot -e 'CREATE DATABASE `sn` DEFAULT CHARACTER SET `utf8`;' && touch /home/vagrant/.db_created"
  creates "/home/vagrant/.db_created"
  action :run
end
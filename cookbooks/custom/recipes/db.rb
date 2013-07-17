# Create db
execute "Create database" do
  command "mysql -e 'CREATE DATABASE `sn` DEFAULT CHARACTER SET `utf8`;' && touch /home/vagrant/.db_created"
  creates "/home/vagrant/.db_created"
  action :run
end

execute "Import database" do
  command "if [ -f /var/source-api/data/db/sn.sql ]; then mysql sn < /var/source-api/data/db/sn.sql; fi"
  action :run
end
execute "Give root access from everywhere" do
  command "mysql -uroot -p#{node[:mysql][:server_root_password]} -e \"GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '#{node[:mysql][:server_root_password]}' WITH GRANT OPTION;\""
  action :run
end
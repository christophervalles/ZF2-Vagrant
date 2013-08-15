template "/etc/php5/fpm/php.ini" do
  source "php.ini.erb"
  owner "root"
  group "root"
  mode "0644"
end
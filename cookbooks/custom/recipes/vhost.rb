template "#{node['nginx']['dir']}/sites-available/zf" do
  source "vhost.erb"
  owner "root"
  group "root"
  mode 00644
  notifies :reload, 'service[nginx]'
end

nginx_site 'zf' do
  enable true
end
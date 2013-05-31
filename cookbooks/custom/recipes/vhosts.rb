template "#{node['nginx']['dir']}/sites-available/zf2-api" do
  source "zf2-api.erb"
  owner "root"
  group "root"
  mode 00644
  notifies :reload, 'service[nginx]'
end

template "#{node['nginx']['dir']}/sites-available/zf2-client" do
  source "zf2-client.erb"
  owner "root"
  group "root"
  mode 00644
  notifies :reload, 'service[nginx]'
end

nginx_site 'zf2-client' do
  enable true
end
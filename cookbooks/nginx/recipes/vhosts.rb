# Install the vhost files
node["nginx"]["sites"].each do |site|
  template "#{node['nginx']['dir']}/sites-available/#{site['hostname']}" do
    source "default-site.erb"
    owner "root"
    group "root"
    mode 00644
    variables({
      :hostname => site['hostname'],
      :root_path => site['root_path']
    })
  end
  
  nginx_site site['hostname'] do
    enable true
  end
end

service "nginx" do 
  action :restart
end
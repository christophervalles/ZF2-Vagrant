service 'php5-fpm' do
  action :restart
end

service 'nginx' do
  action :restart
end

service 'mysql' do
  action :restart
end
execute "Add host to hosts file" do
  command "echo '127.0.0.1 zf2-api' >> /etc/hosts && touch /home/vagrant/.hosts"
  creates "/home/vagrant/.hosts"
  action :run
end
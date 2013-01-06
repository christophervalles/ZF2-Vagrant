ruby_block "IP of the VM" do
  block do
    ip = node[:network][:interfaces][:eth1][:addresses].find {|addr, addr_info| addr_info[:family] == "inet"}.first
    Chef::Log.info('************************************************')
    Chef::Log.info('')
    Chef::Log.info('')
    Chef::Log.info("IP OF THE VM: #{ip}")
    Chef::Log.info('')
    Chef::Log.info('')
    Chef::Log.info('************************************************')
  end
  action :create
end
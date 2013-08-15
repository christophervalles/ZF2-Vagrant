apt_repository "dotdeb" do
  uri 'http://packages.dotdeb.org'
  distribution 'squeeze'
  components ['all']
  key "http://www.dotdeb.org/dotdeb.gpg"
  deb_src true
end

execute "update apt sources" do
  command "apt-get update"
  action :run
end
docker_image 'progrium/consul' do
  action :pull_if_missing
end

docker_container 'consul' do
  image 'progrium/consul'
  detach true
  container_name 'consul'
  port ['8400:8400', '8500:8500', '8600:53/udp']
  hostname node['fqdn']
  command '-server -bootstrap -ui-dir /ui'
end

# ohai plugin for consul attributes
chef_gem "yajl-ruby"

ohai "reload" do
  action :nothing
end

remote_file "#{node[:ohai][:plugin_path]}/consul.rb" do
  source "https://raw.githubusercontent.com/fujiwara/ohai-plugin-consul/master/lib/consul.rb"
  notifies :reload, "ohai[reload]", :immediately
end

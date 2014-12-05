include_recipe 'consul'
include_recipe 'consul::ui'

# ohai plugin for consul attributes
chef_gem "yajl-ruby"

ohai "reload" do
  action :nothing
end

remote_file "#{node[:ohai][:plugin_path]}/consul.rb" do
  source "https://raw.githubusercontent.com/fujiwara/ohai-plugin-consul/master/lib/consul.rb"
  notifies :reload, "ohai[reload]", :immediately
end

package 'haproxy'

template '/etc/haproxy/haproxy.cfg' do
  source 'haproxy.cfg.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[haproxy]'
end

file '/etc/default/haproxy' do
  owner 'root'
  group 'root'
  mode '0644'
  content 'ENABLED=1'
  notifies :restart, 'service[haproxy]'
end

service 'haproxy' do
  action [ :enable, :start ]
end

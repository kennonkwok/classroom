
docker_image 'progrium/registrator' do
  action :pull_if_missing
end

docker_container 'registrator' do
  image 'progrium/registrator'
  detach true
  container_name 'registrator'
  hostname node['fqdn']
  # publish_exposed_ports true
  volume '/var/run/docker.sock:/tmp/docker.sock'
  command "consul://#{node['ipaddress']}:8500"
end

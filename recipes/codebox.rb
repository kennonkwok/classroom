docker_image 'kennonkwok/codebox' do
  action :pull_if_missing
end

(1..node['classroom']['start_containers']).each do |instance|
  container_id = 'codebox-' + instance.to_s
  container_uid = rand(36**8).to_s(36)
  docker_container container_id do
    image 'kennonkwok/codebox'
    container_name container_id
    env ["SERVICE_NAME=#{container_uid}", "SERVICE_TAGS=codebox"]
    publish_exposed_ports true
    detach true
    command '-u chef:chef run chef-training'
    notifies :reload, "ohai[reload]", :immediately
  end
end

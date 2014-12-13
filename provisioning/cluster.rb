require 'chef/provisioning'

machine 'bootstrap' do
  add_machine_options :vagrant_options => {
      'vm.hostname' => "consul-bootstrap"
    }, :vagrant_config => <<-EOM
      config.vm.network :private_network, ip: '192.168.23.9'
    EOM
  recipe 'consul'
  recipe 'consul::ui'
  attributes(
    consul: {
      servers: ['192.168.23.9'],
      service_mode: 'cluster',
      extra_params: { "bind_addr" => "192.168.23.9" },
      serve_ui: true
    }
  )
end

1.upto(2) do |i|
  machine "consul#{i}" do
    add_machine_options :vagrant_options => {
        'vm.hostname' => "consul#{i}"
      }, :vagrant_config => <<-EOM
        config.vm.network :private_network, ip: "192.168.23.1#{i}"
      EOM
    recipe 'consul'
    recipe 'consul::ui'
    attributes(
      consul: {
        servers: ['192.168.23.9'],
        service_mode: 'cluster',
        extra_params: { "bind_addr" => "192.168.23.1#{i}" },
        serve_ui: true
      }
    )
  end
end

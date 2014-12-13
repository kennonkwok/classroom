require 'chef/provisioning/vagrant_driver'
current_dir = File.dirname(__FILE__)
with_driver "vagrant:#{current_dir}/machines"

vagrant_box 'opscode-centos-7.0' do
  url 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-7.0_chef-provisionerless.box'
end

with_machine_options :vagrant_options => {
  'vm.box' => 'opscode-centos-7.0'
}

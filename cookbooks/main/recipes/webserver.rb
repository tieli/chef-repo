include_recipe 'apache2'

group node['chef_test']['group']

user node['chef_test']['user'] do
  group node['chef_test']['group']
  system true
  shell '/bin/bash'
end

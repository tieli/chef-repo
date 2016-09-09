###############################
# Apache Server Configuration
###############################

group node['silkstyle']['group']

user node['silkstyle']['user'] do
  group node['silkstyle']['group']
  system true
  shell '/bin/bash'
end

include_recipe 'apache2'

# disable default site
apache_site '000-default' do
  enable false
end

# create apache config
template "#{node['apache']['dir']}/sites-available/#{node['silkstyle']['config']}" do
  source "#{node['silkstyle']['config']}.erb"
  #notifies :restart, 'service[apache2]'
end

# create document root
directory "#{node['silkstyle']['document_root']}" do
  action :create
  recursive true
end

# write site
cookbook_file "#{node['silkstyle']['document_root']}/index.html" do
  mode '0644' # forget me to create debugging exercise
end

# enable silkstyle
apache_site "#{node['silkstyle']['name']}" do
  enable true
  notifies :restart, 'service[apache2]'
end

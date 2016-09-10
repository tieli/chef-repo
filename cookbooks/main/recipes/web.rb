###############################
# Apache Server Configuration
###############################

group node['silkstyle']['group']

user node['silkstyle']['user'] do
  group node['silkstyle']['group']
  system true
  shell '/bin/bash'
end

# Install Apache and start the service.
httpd_service 'silkstyle' do
 mpm 'prefork'
 action [:create, :start]
end

# Add the site configuration.
httpd_config 'silkstyle' do
 instance 'silkstyle'
 source 'silkstyle.conf.erb'
 action :create
 notifies :restart, 'httpd_service[silkstyle]'
end

# Create the document root directory.
directory node['silkstyle']['document_root'] do
 recursive true
end

# Write the home page.
template "#{node['silkstyle']['document_root']}/index.php" do
 source 'index.php.erb'
 mode '0644'
 owner node['silkstyle']['user']
 group node['silkstyle']['group']
end

# Install the mod_php5 Apache module.
httpd_module 'php5' do
  instance 'silkstyle'
end

# Install php5-mysql.
package 'php5-mysql' do
  action :install
  notifies :restart, 'httpd_service[silkstyle]'
end

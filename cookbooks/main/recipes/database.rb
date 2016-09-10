
# include_recipe 'mysql::server'
# include_recipe 'mysql::client'

# Configure the MySQL client.
mysql_client 'default' do
  action :create
end

# Need this to install mysql2
package ["libmysqlclient-dev", "ruby-dev"] do
  action :install
end

# Install the mysql2 Ruby gem.
mysql2_chef_gem 'default' do
  action :install
end

# Configure the MySQL service.
mysql_service 'default' do
  initial_root_password node['mysql']['server_root_password']
  action [:create, :start]
end

mysql_database node['silkstyle']['database']['dbname'] do
  connection(
    :host => node['silkstyle']['database']['host'],
    :username => node['silkstyle']['database']['username'],
    :password => node['silkstyle']['database']['root_password']
  )
  action :create
end

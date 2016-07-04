#
# Cookbook Name:: main
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

################
# Missing xfce4
################

include_recipe 'main::package'

#################################################
# install pythin virtualenv and other packages
# Not working
#################################################

# include_recipe 'poise-python'
#
# #python_runtime '2'
#
# #python_virtualenv '/home/vagrant/venv'
#
# python_pip 'Django' do
#    version '1.9'
# end
#

# update rc files
rc_files = %w{.bashrc .bash_aliases .ansible.cfg .gemrc .irbrc .railsrc .screenrc}
rc_files.each do |file|
   template "/home/#{node[:user][:name]}/#{file}" do
     erb_file = file[1..-1]
     source "#{erb_file}.erb"
   end
end

bash "append_to_hosts" do
  user "root"
  code <<-EOF
    echo "10.0.0.1 server server.silkstyle.com" >> /etc/hosts
    echo "10.0.0.2 server1 server1.silkstyle.com" >> /etc/hosts
    echo "10.0.0.3 server2 server2.silkstyle.com" >> /etc/hosts
    echo "10.0.0.4 server3 server3.silkstyle.com" >> /etc/hosts
    echo "10.0.0.10 chef chef.silkstyle.com" >> /etc/hosts
    echo "10.0.0.11 chef12 chef12.silkstyle.com" >> /etc/hosts
   EOF
end

#
# Cookbook Name:: main
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

####################################
# Need this for Apache Installation
####################################

execute "update-upgrade" do
  command "apt-get update && apt-get upgrade -y"
  action :run
end

#################
# Create user tli
#################

group node[:group][:name] do
  action :create
  gid node[:group][:gid]
  group_name node[:group][:name]
end

user node[:user][:name] do
  comment "user tli"
  password node[:user][:password]
  uid node[:user][:uid]
  gid node[:user][:gid]
  home "/home/#{node[:user][:name]}"
  shell node[:user][:shell]
  supports manage_home: true
end

#################
# Missing xfce4
#################

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

##################
#
##################

include_recipe 'apt::default'

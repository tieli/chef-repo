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

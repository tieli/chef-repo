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
include_recipe 'poise-python'

include_recipe 'main::package'
include_recipe 'main::webserver'

# python_runtime '2'

#python_virtualenv '/home/vagrant/venv'

# python_package 'Django' do
#   version '1.9'
# end

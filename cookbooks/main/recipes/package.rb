
include_recipe 'apt::default'

execute "add repo" do
  command "yes | sudo add-apt-repository ppa:webupd8team/atom"
  action :run
end

execute "add repo php5" do
  #command "yes | sudo add-apt-repository ppa:ondrej/php5-5.6"
  command "yes | sudo add-apt-repository ppa:ondrej/php"
  action :run
end

execute "update-upgrade" do
  command "apt-get update && apt-get upgrade -y"
  action :run
end

pkg_libs = %w{libncurses5-dev libfreetype6 libfreetype6-dev libfontconfig1
  libfontconfig1-dev openssl libssl-dev }

pkgs_apps = %w{python2.7-mysqldb python-dev python-software-properties
  build-essential virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11}

pkg_php = %w{php5 php5-mysql php-gettext}

pkg_utils = %w{rcconf curl htop tree par git screen firefox cloc subversion vim keychain xterm xorg keychain nodejs }

pkgs = pkg_libs + pkg_utils + pkgs_apps + pkg_php

pkgs.each do |pkg|
  package pkg do
    action :install
  end
end

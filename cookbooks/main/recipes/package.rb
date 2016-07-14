
include_recipe 'apt::default'

execute "add repo" do
  command "yes | sudo add-apt-repository ppa:webupd8team/atom"
  action :run
end

execute "update-upgrade" do
  command "apt-get update && apt-get upgrade -y"
  action :run
end

pkg_libs = %w{libncurses5-dev libfreetype6 libfreetype6-dev
              libfontconfig1 libfontconfig1-dev
              openssl libssl-dev}

pkg_utils = %w{bum rcconf atom curl chrpath htop tree par git
              screen firefox cloc subversion vim keychain }

pkgs_apps = %w{apache2 apache2-utils python2.7-mysqldb python-dev
              build-essential virtualbox-guest-dkms
              virtualbox-guest-utils virtualbox-guest-x11}

pkgs = pkg_libs + pkg_utils + pkgs_apps

pkgs.each do |pkg|
  package pkg do
    action :install
  end
end

include_recipe 'phantomjs'
include_recipe 'mysql::server'
include_recipe 'mysql::client'

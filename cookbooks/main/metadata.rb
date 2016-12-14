name             'main'
maintainer       'Tiejun Li'
maintainer_email 'tiejli@yahoo.com'
license          'All rights reserved'
description      'Installs/Configures main'
long_description 'Installs/Configures main'
version          '1.0.0'

depends 'apt', '~> 4.0.2'
depends 'mysql', '~> 8.0'

depends 'rvm'
depends 'phantomjs'

depends 'httpd', '~> 0.4.0'

depends 'database', '~> 5.1.2'
depends 'mysql2_chef_gem', '~> 1.1.0'
depends 'firewall', '~> 2.5.3'

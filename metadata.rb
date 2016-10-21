name             'php-fpm'
maintainer       'Opscode, Inc.'
maintainer_email 'cookbooks@opscode.com'
license          'Apache 2.0'
description      'Installs/Configures php-fpm'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'
issues_url       'https://github.com/tecnocratica/php-fpm-cookbook/issues'
source_url       'https://github.com/tecnocratica/php-fpm-cookbook'

depends 'apt'
depends 'yum', '>= 3.0'

%w{ debian ubuntu centos redhat fedora }.each do |os|
  supports os
end

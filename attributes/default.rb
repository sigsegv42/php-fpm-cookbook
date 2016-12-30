#
# Author::  Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: php-fpm
# Attributes:: default
#
# Copyright 2011, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node['platform_family']
when 'rhel', 'fedora'
  user = 'apache'
  group = 'apache'
  conf_dir = '/etc/php.d'
  pool_conf_dir = '/etc/php-fpm.d'
  conf_file = '/etc/php-fpm.conf'
  error_log = '/var/log/php-fpm/error.log'
  pid = '/var/run/php-fpm/php-fpm.pid'
else
  user = 'www-data'
  group = 'www-data'
  if platform?('ubuntu') && node['platform_version'].to_f >= 16.04
    php_conf_dir = '/etc/php/7.0'
  else
    php_conf_dir = '/etc/php5'
  end
  conf_dir = "#{php_conf_dir}/fpm/conf.d"
  pool_conf_dir = "#{php_conf_dir}/fpm/pool.d"
  if platform?('ubuntu') && node['platform_version'].to_f <= 10.04
    conf_file = "#{php_conf_dir}/fpm/php5-fpm.conf"
  else
    conf_file = "#{php_conf_dir}/fpm/php-fpm.conf"
  end
  error_log = '/var/log/php7.0-fpm.log'
  pid = '/var/run/php7.0-fpm.pid'
end

default['php-fpm']['user'] = user
default['php-fpm']['group'] = group
default['php-fpm']['conf_dir'] = conf_dir
default['php-fpm']['pool_conf_dir'] = pool_conf_dir
default['php-fpm']['conf_file'] = conf_file
default['php-fpm']['pid'] = pid
default['php-fpm']['log_dir'] = '/var/log/php-fpm'
default['php-fpm']['error_log'] = error_log
default['php-fpm']['log_level'] = 'notice'
default['php-fpm']['emergency_restart_threshold'] = 0
default['php-fpm']['emergency_restart_interval'] = 0
default['php-fpm']['process_control_timeout'] = 0
default['php-fpm']['process_manager'] = 'ondemand'
default['php-fpm']['max_children'] = 50
default['php-fpm']['start_servers'] = 5
default['php-fpm']['min_spare_servers'] = 5
default['php-fpm']['max_spare_servers'] = 35
default['php-fpm']['max_requests'] = 0
default['php-fpm']['request_terminate_timeout'] = 0
default['php-fpm']['catch_workers_output'] = 'no'
default['php-fpm']['security_limit_extensions'] = '.php'
default['php-fpm']['listen_mode'] = '0660'
default['php-fpm']['listen'] = '/var/run/php-fpm-%{pool_name}.sock'
default['php-fpm']['status_path'] = nil

default['php-fpm']['pools'] = {
  'www' => {
    enable: true
  }
}

default['php-fpm']['skip_repository_install'] = false
default['php-fpm']['installation_action'] = :install
default['php-fpm']['version'] = nil

case node['platform_family']
when 'rhel'
  default['php-fpm']['yum_url'] = 'http://rpms.famillecollet.com/enterprise/$releasever/remi/$basearch/'
  default['php-fpm']['yum_mirrorlist'] = 'http://rpms.famillecollet.com/enterprise/$releasever/remi/mirror'
when 'fedora'
  default['php-fpm']['skip_repository_install'] = true
end

default['php-fpm']['dotdeb_repository']['uri'] = 'http://packages.dotdeb.org'
default['php-fpm']['dotdeb_repository']['key'] = 'http://www.dotdeb.org/dotdeb.gpg'
default['php-fpm']['dotdeb-php53_repository']['uri'] = 'http://php53.dotdeb.org'

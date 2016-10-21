require 'serverspec'

set :backend, :exec

describe port(9081) do
  it { should be_listening }
end

describe file('/etc/php-fpm.d/web.conf') do
  its(:content) { should match /pm.status_path = \/status/ }
end

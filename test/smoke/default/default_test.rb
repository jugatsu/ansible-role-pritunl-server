# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

cmd = 'apt-key adv --list-public-keys --with-fingerprint'
cmd << " --with-colons | grep ^fpr | cut -d':' -f 10"
cmd << ' | grep 7568D9BB55FF9E5287D586017AE645C0CF8E292A'

describe command(cmd) do
  its('exit_status') { should eq 0 }
end

describe apt('http://repo.pritunl.com/stable/apt') do
  it { should exist }
  it { should be_enabled }
end

case os[:release]
when '12.04'
  describe package('pritunl') do
    it { should be_installed }
    its('version') { should eq '1.28.1487.93-0ubuntu1~precise' }
  end
when '14.04'
  describe package('pritunl') do
    it { should be_installed }
    its('version') { should eq '1.28.1487.93-0ubuntu1~trusty' }
  end
when '16.04'
  describe package('pritunl') do
    it { should be_installed }
    its('version') { should eq '1.28.1487.93-0ubuntu1~xenial' }
  end
end

describe service('pritunl') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port(9755) do
  its('processes') { should include 'pritunl' }
end

describe port(80) do
  its('processes') { should include 'pritunl-web' }
  its('protocols') { should include 'tcp' }
end

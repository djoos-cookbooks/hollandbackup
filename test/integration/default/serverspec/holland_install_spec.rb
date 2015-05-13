require 'serverspec'

set :backend, :exec

describe package('holland') do
  it { should be_installed }
end

describe file('/etc/holland') do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 755 }
end

describe file('/etc/holland/holland.conf') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:content) { should match %r{backup_directory = \/var\/spool\/holland} }
end

describe file('/etc/holland/providers/mysqldump.conf') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its(:content) { should match(/\[mysqldump\]/) }
end

describe file('/etc/holland/backupsets/default.conf') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its(:content) { should match(/\[mysqldump\]/) }
end

describe command('holland bk') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match(/Backup completed in/) }
end

require 'spec_helper'

describe 'test-cookbook' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'installs holland backup' do
    expect(chef_run).to install_hollandbackup('Install holland')
  end

  it 'writes holland.conf file' do
    expect(chef_run).to configure_hollandbackup_conf('configure holland')
  end

  it 'write mysqldump.conf file' do
    expect(chef_run).to configure_hollandbackup_mysqldump('/etc/holland/providers/mysqldump.conf')
  end

  it 'creates a backupset' do
    expect(chef_run).to configure_hollandbackup_backupset('/etc/holland/backupsets/default.conf')
  end
end

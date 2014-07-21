require 'spec_helper'

describe 'hollandbackup::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'includes the repository recipe' do
    expect(chef_run).to include_recipe('hollandbackup::repository')
  end
end

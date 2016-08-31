#
# Cookbook Name:: hollandbackup
# Provider:: mysqldump
#
# Copyright (c) 2016, David Joos
#

use_inline_resources if defined?(use_inline_resources)

def whyrun_supported?
  true
end

action :configure do
  Chef::Log.debug 'PROVIDER: mysqldump.conf'

  template '/etc/holland/providers/mysqldump.conf' do
    source 'mysqldump.conf.erb'
    owner 'root'
    group 'root'
    mode 0644
    variables(
      :resource => new_resource
    )
  end
  new_resource.updated_by_last_action(true)
end

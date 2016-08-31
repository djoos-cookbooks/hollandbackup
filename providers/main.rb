#
# Cookbook Name:: hollandbackup
# Provider:: main
#
# Copyright (c) 2016, David Joos
#

use_inline_resources if defined?(use_inline_resources)

def whyrun_supported?
  true
end

action :configure do
  Chef::Log.debug 'MAIN: holland.conf'

  template '/etc/holland/holland.conf' do
    source 'holland.conf.erb'
    owner 'root'
    group 'root'
    mode 0644
    variables(
      :resource => new_resource
    )
  end
  new_resource.updated_by_last_action(true)
end

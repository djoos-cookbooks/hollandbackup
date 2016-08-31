#
# Cookbook Name:: hollandbackup
# Provider:: backupset
#
# Copyright (c) 2016, David Joos
#

use_inline_resources if defined?(use_inline_resources)

def whyrun_supported?
  true
end

action :configure do
  Chef::Log.debug "BACKUPSET: #{new_resource.name}.conf"

  template "/etc/holland/backupsets/#{new_resource.name}.conf" do
    source 'backupset.conf.erb'
    owner 'root'
    group 'root'
    mode 0644
    variables(
      :resource => new_resource
    )
  end
  new_resource.updated_by_last_action(true)
end

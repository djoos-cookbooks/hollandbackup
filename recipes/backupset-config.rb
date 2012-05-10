#
# Cookbook Name:: chef-hollandbackup
# Recipe:: backupset-config
#
# Copyright 2012, Escape Studios
#

backupsets = node['hollandbackup']['backupsets']

unless backupsets.nil?
	backupsets.keys.each do |key|
		template "/etc/holland/backupsets/#{backupsets[key]['name']}.conf" do
			source "default.conf.erb"
			owner "root"
			group "root"
			mode 0640
			variables(
				:mysql_client_user => backupsets[key]['mysql_client_user'],
				:mysql_client_password => backupsets[key]['mysql_client_password']
			)
		end
	end
end
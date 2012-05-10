#
# Cookbook Name:: chef-hollandbackup
# Recipe:: main-config
#
# Copyright 2012, Escape Studios
#

backupsets = node['hollandbackup']['backupsets']

template "/etc/holland/holland.conf" do
	source "holland.conf.erb"
	owner "root"
	group "root"
	mode 0640
	variables(
		:backupsets => backupsets
	)
end
#
# Cookbook Name:: hollandbackup
# Recipe:: holland-mysqldump
#
# Copyright 2012, David Joos
#

package "holland-mysqldump" do
	action :install
	options "--force-yes"
end
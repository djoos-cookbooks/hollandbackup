#
# Cookbook Name:: hollandbackup
# Recipe:: default
#
# Copyright 2012-2013, David Joos
#

#TEMP
include_recipe "hollandbackup::repository"
include_recipe "hollandbackup::main"
include_recipe "hollandbackup::backupsets"
include_recipe "hollandbackup::mysqldump"
#
# Cookbook Name:: chef-hollandbackup
# Attributes:: default
#
# Copyright 2012, Escape Studios
#

default['hollandbackup']['distro'] = "xUbuntu_10.04"
default['hollandbackup']['backupsets'] = {}
default['hollandbackup']['cron']['minute'] = ""
default['hollandbackup']['cron']['hour'] = "*/6"
default['hollandbackup']['cron']['day'] = ""
default['hollandbackup']['cron']['month'] = ""
default['hollandbackup']['cron']['weekday'] = ""
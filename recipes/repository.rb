#
# Cookbook Name:: hollandbackup
# Recipe:: repository
#
# Copyright (c) 2016, David Joos
#

case node['platform']
when 'debian', 'ubuntu'
  # trust the hollandbackup GPG key
  distro = node['hollandbackup']['repository']['distro']
  gpg_key_url = "http://download.opensuse.org/repositories/home:/holland-backup/#{distro}/Release.key"

  remote_file "#{Chef::Config[:file_cache_path]}/hollandkey" do
    source gpg_key_url
  end

  execute 'hollandbackup-add-gpg-key' do
    command "apt-key add #{Chef::Config[:file_cache_path]}/hollandkey"
    notifies :run, 'execute[hollandbackup-apt-get-update]', :immediately
    not_if "apt-key list | grep #{distro}"
  end

  # configure the hollandbackup apt repository
  file '/etc/apt/sources.list.d/holland.list' do
    owner 'root'
    group 'root'
    mode 0644
    content "deb http://download.opensuse.org/repositories/home:/holland-backup/#{distro}/ ./"
    notifies :run, 'execute[hollandbackup-apt-get-update]', :immediately
    action :create_if_missing
  end

  # update the local package list
  execute 'hollandbackup-apt-get-update' do
    command 'apt-get update'
    action :nothing
  end
when 'centos', 'redhat'
  include_recipe 'yum-epel'
end

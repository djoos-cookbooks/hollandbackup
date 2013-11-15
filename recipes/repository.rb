#
# Cookbook Name:: hollandbackup
# Recipe:: repository
#
# Copyright 2012-2013, David Joos
#

case node[:platform]
    when "debian", "ubuntu"
        #trust the hollandbackup GPG key
        distro = node[:hollandbackup][:distro]
        gpg_key_url = "http://download.opensuse.org/repositories/home:/holland-backup/#{distro}/Release.key"

        execute "hollandbackup-add-gpg-key" do
            command "wget -O - #{gpg_key_url} | apt-key add -"
            notifies :run, "execute[hollandbackup-apt-get-update]", :immediately
            not_if "apt-key list | grep #{distro}"
        end

        #configure the hollandbackup apt repository
        local_file = "/etc/apt/sources.list.d/holland.list"

        file "#{local_file}" do
            owner "root"
            group "root"
            mode 0644
            content "deb http://download.opensuse.org/repositories/home:/holland-backup/#{distro}/ ./"
            notifies :run, "execute[hollandbackup-apt-get-update]", :immediately
            action :create_if_missing
        end

        #update the local package list
        execute "hollandbackup-apt-get-update" do
            command "apt-get update"
            action :nothing
        end
end
require 'chef/provider/lwrp_base'
require_relative 'helpers'

class Chef
  class Provider
    class Hollandbackup < Chef::Provider::LWRPBase
      include HollandBackupCookbook::Helpers

      use_inline_resources if defined?(use_inline_resources)

      action :install do
        case node['platform_family']
        when 'debian'
          file '/etc/apt/sources.list.d/holland.list' do
            owner 'root'
            group 'root'
            mode 0644
            content "deb #{repo_url} ./"
            notifies 'run', 'execute[holland-apt-get-update]', 'immediately'
            action 'create_if_missing'
          end

          remote_file "#{Chef::Config[:file_cache_path]}/hollandkey" do
            source gpg_key_url
          end

          execute 'holland-add-gpg-key' do
            command "apt-key add #{Chef::Config[:file_cache_path]}/hollandkey"
            notifies 'run', 'execute[holland-apt-get-update]', 'immediately'
            not_if "apt-key list | grep #{distro}"
          end

          execute 'holland-apt-get-update' do
            command 'apt-get update'
            action :nothing
          end
        when 'rhel'
          include_recipe('yum-epel')
        end

        package 'holland' do
          package_name new_resource.package_name if new_resource.package_name
          version new_resource.package_version if new_resource.package_version
          options new_resource.package_manager_flags if new_resource.package_manager_flags
        end

        new_resource.additional_packages.each do |package_name|
          package "additional holland package #{package_name}" do
            package_name package_name
          end
        end
      end

      action :uninstall do
        package 'holland' do
          package_name new_resource.package_name if new_resource.package_name
          action :remove
        end

        new_resource.additional_packages.each do |package_name|
          package "additional holland package #{package_name}" do
            package_name package_name
            action :remove
          end
        end

        if node['platform_family'] == 'debian'
          file '/etc/apt/sources.list.d/holland.list' do
            action :delete
          end
        end
      end
    end
  end
end

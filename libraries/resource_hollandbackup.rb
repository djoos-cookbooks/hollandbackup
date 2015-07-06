require 'chef/resource/lwrp_base'

class Chef
  class Resource
    class Hollandbackup < Chef::Resource::LWRPBase
      self.resource_name = :hollandbackup
      actions :install, :uninstall
      default_action :install

      # install attributes
      attribute :repo_name, :kind_of => String
      attribute :package_version, :kind_of => String
      attribute :package_name, :kind_of => String
      attribute :repo_url, :kind_of => String
      attribute :gpg_key_url, :kind_of => String
      attribute :additional_packages, :kind_of => Array, :default => []
      attribute :package_manager_flags, :kind_of => String
    end
  end
end

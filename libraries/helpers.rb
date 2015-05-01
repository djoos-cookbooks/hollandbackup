module HollandBackupCookbook
  module Helpers
    include Chef::DSL::IncludeRecipe

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    def distro
      return new_resource.repo_name if new_resource.repo_name
      return 'RHEL_7' if node['platform'] == 'redhat' && node['platform_version'].to_i == 7
      return 'RedHat_RHEL-6' if node['platform'] == 'redhat' && node['platform_version'].to_i == 6
      return 'RedHat_RHEL-5' if node['platform'] == 'redhat' && node['platform_version'].to_i == 5
      return 'RedHat_RHEL-4' if node['platform'] == 'redhat' && node['platform_version'].to_i == 4

      return 'CentOS_7' if node['platform_family'] == 'rhel' && node['platform_version'].to_i == 7
      return 'CentOS_CentOS-6' if node['platform_family'] == 'rhel' && node['platform_version'].to_i == 6
      return 'CentOS_CentOS-5' if node['platform_family'] == 'rhel' && node['platform_version'].to_i == 5

      return 'Debian_7.0' if node['platform'] == 'debian' && node['platform_version'].to_i == 7
      return 'Debian_6.0' if node['platform'] == 'debian' && node['platform_version'].to_i == 6

      return 'xUbuntu_10.04' if node['platform_family'] == 'debian' && node['platform_version'] == '10.04'
      return 'xUbuntu_12.04' if node['platform_family'] == 'debian' && node['platform_version'] == '12.04'
      return 'xUbuntu_13.04' if node['platform_family'] == 'debian' && node['platform_version'] == '13.04'
      return 'xUbuntu_13.10' if node['platform_family'] == 'debian' && node['platform_version'] == '13.10'
      return 'xUbuntu_14.04' if node['platform_family'] == 'debian' && node['platform_version'] == '14.04'
    end

    def repo_url
      return new_resource.repo_url if new_resource.repo_url
      "http://download.opensuse.org/repositories/home:/holland-backup/#{distro}/"
    end

    def gpg_key_url
      return new_resource.gpg_key_url if new_resource.gpg_key_url
      "http://download.opensuse.org/repositories/home:/holland-backup/#{distro}/Release.key"
    end
  end
end

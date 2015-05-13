class Chef
  class Resource::HollandbackupConf < Resource
    include Poise

    actions(:configure)

    # holland.conf
    attribute(:path, :kind_of => String, :name_attribute => true)
    attribute(:owner, :kind_of => String, :default => 'root')
    attribute(:group, :kind_of => String, :default => 'root')
    attribute(:mode, :kind_of => String, :default => '0644')
    attribute(:cookbook, :kind_of => String, :default => 'hollandbackup')
    attribute(:conf, :option_collector => true, :default => {
                # holland conf
                :plugin_dirs => '/usr/share/holland/plugins',
                :backup_directory => '/var/spool/holland',
                :backupsets => 'default',
                :umask => '0007',
                :path => '/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin',
                # logging
                :filename => '/var/log/holland/holland.log',
                :level => 'info' })
  end
end

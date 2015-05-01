class Chef
  class Resource::HollandbackupBackupset < Resource
    include Poise

    actions(:configure)
    default_action(:configure)

    # template
    attribute(:path, :kind_of => String, name_attribute: true)
    attribute(:source, :kind_of => String, :default => 'backupset_full.conf.erb')
    attribute(:owner, :kind_of => String, :default => 'root')
    attribute(:group, :kind_of => String, :default => 'root')
    attribute(:mode, :kind_of => String, :default => '0644')
    attribute(:cookbook, :kind_of => String, :default => 'hollandbackup')
    attribute(:conf, option_collector: true, :default => {
      plugin: 'mysqldump',
      backups_to_keep: '1',
      estimated_size_factor: '1.0',
      auto_purge_failures: 'yes',
      purge_policy: 'after-backup',
      lock_method: 'auto-detect',
      method: 'gzip',
      inline: 'yes',
      level: '1',
      defaults_extra_file: '/root/.my.cnf,~/.my.cnf,',})
  end
end

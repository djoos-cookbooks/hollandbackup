require 'chef/resource/lwrp_base'

class Chef
  class Resource::HollandbackupMysqldump < Resource
    include Poise

    actions(:configure)
    default_action(:configure)

    # template
    attribute(:path, :kind_of => String, name_attribute: true)
    attribute(:source, :kind_of => String, :default => 'mysqldump.conf.erb')
    attribute(:owner, :kind_of => String, :default => 'root')
    attribute(:group, :kind_of => String, :default => 'root')
    attribute(:mode, :kind_of => String, :default => '0644')
    attribute(:cookbook, :kind_of => String, :default => 'hollandbackup')
    attribute(:conf, option_collector: true, :default => {
      lock_method: 'auto-detect',
      dump_routines: 'no',
      dump_events: 'no',
      stop_slave: 'no',
      bin_log_position: 'no',
      flush_logs: 'no',
      file_per_database: 'no',
      additional_options: '',
      method: 'gzip',
      inline: 'yes',
      level: 1,
      defaults_extra_file: '/root/.my.cnf,~/.my.cnf,'})
  end
end

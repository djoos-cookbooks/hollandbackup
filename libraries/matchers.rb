if defined?(ChefSpec)
  def install_hollandbackup(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:hollandbackup, :install, resource_name)
  end

  def configure_hollandbackup_conf(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:hollandbackup_conf, :configure, resource_name)
  end

  def configure_hollandbackup_mysqldump(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:hollandbackup_mysqldump, :configure, resource_name)
  end

  def configure_hollandbackup_backupset(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:hollandbackup_backupset, :configure, resource_name)
  end
end

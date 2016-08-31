name 'hollandbackup'
maintainer 'David Joos'
maintainer_email 'development@davidjoos.com'
license 'MIT'
description 'Installs/Configures hollandbackup'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.3.0'

%w(debian ubuntu centos redhat).each do |os|
  supports os
end

source_url 'https://github.com/djoos-cookbooks/hollandbackup' if respond_to?(:source_url)
issues_url 'https://github.com/djoos-cookbooks/hollandbackup/issues' if respond_to?(:issues_url)

depends 'yum-epel'
depends 'apt'
depends 'chef-sugar'
depends 'mysql'

recipe 'hollandbackup', 'Adds the Holland Backup repository.'
recipe 'hollandbackup::repository', 'Adds the Holland Backup repository.'
recipe 'hollandbackup::mysqldump', 'Installs & configures the Holland Backup mysqldump provider.'
recipe 'hollandbackup::main', 'Configures the main Holland Backup settings.'
recipe 'hollandbackup::backupsets', 'Configures the Holland Backup backupset(s) settings.'

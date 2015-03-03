name 'hollandbackup'
maintainer 'David Joos'
maintainer_email 'david.joos@escapestudios.com'
license 'MIT'
description 'Installs/Configures hollandbackup'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.2'

%w(debian ubuntu centos redhat).each do |os|
  supports os
end

depends 'yum-epel'
depends 'apt'
depends 'chef-sugar'
depends 'mysql'

recipe 'hollandbackup', 'Adds the Holland Backup repository.'
recipe 'hollandbackup::repository', 'Adds the Holland Backup repository.'
recipe 'hollandbackup::mysqldump', 'Installs & configures the Holland Backup mysqldump provider.'
recipe 'hollandbackup::main', 'Configures the main Holland Backup settings.'
recipe 'hollandbackup::backupsets', 'Configures the Holland Backup backupset(s) settings.'

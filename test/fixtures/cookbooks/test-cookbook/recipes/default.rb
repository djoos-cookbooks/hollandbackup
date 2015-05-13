mysql_service 'default' do
  version '5.5'
  action [:create, :start]
end

mysql_client 'default'

hollandbackup 'Install and configure holland' do
  action :install
  additional_packages ['holland-mysqldump']
end

hollandbackup_mysqldump '/etc/holland/providers/mysqldump.conf' do
  conf do
    file_per_database 'yes'
    password 'ilikerandompasswords'
    socket '/var/run/mysql-default/mysqld.sock'
    host '127.0.0.1'
    port '3306'
  end
end

hollandbackup_backupset '/etc/holland/backupsets/default.conf' do
  conf do
    plugin 'mysqldump'
    filer_per_database 'yes'
  end
end

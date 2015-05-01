hollandbackup 'test' do
  action :install
  additional_packages ['holland-mysqldump']
end

hollandbackup 'test' do
  action :uninstall
end

class Chef
  class Provider::HollandbackupConf < Provider
    include Poise

    def action_configure
      converge_by('configure conf file for holland') do
        template new_resource.path do
          owner new_resource.owner
          group new_resource.group
          mode new_reosurce.mode
          variables(
            :conf => new_resource.options
          )
        end
      end
    end
  end
end

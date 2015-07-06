class Chef
  class Provider::HollandbackupConf < Provider
    include Poise

    def action_configure
      converge_by('configure conf file for holland') do
        template new_resource.path do
          source new_resource.source
          owner new_resource.owner
          group new_resource.group
          mode new_resource.mode
          cookbook new_resource.cookbook
          variables(
            :conf => new_resource.conf
          )
        end
      end
    end
  end
end

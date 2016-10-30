module CpOraclecloud
  class ComputeInstance < CloudInstance
    include CpOraclecloud::ComputeMixin

		def provision
			connection.instances.create(init_config)
		end

		def wait
			fog.wait_for { ready? }
		end

		def provider
			"OracleCloud"
		end

		def cloud_type
			"Compute"
		end

		def fog
			@instance ||= connection.instances.get(name)
			@instance
		end

		def attr_get(attribute)
			begin
				@instance ||= connection.instances.get(name)
				@instance.attributes[attribute.to_sym]
			rescue Fog::Compute::OracleCloud::NotFound
				"Error"
			end
		end

		def month_cost
			calculate_monthly_cost(init_config)
		end

		def calc_cost(start_date, end_date)
			cost = 0
			cost = (end_date - start_date) * (month_cost / 30)
			cost
		end

		def connection 
      @connection ||= Fog::Compute.new(
        :provider => 'OracleCloud',
        :oracle_username => CpOraclecloud.username,
        :oracle_password => CpOraclecloud.password,
        :oracle_domain => CpOraclecloud.domain,
        :oracle_compute_api => CpOraclecloud.compute_api
        )
		end

	end
end
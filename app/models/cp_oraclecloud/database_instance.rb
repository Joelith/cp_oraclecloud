module CpOraclecloud
  class DatabaseInstance < CloudInstance
  	include CpOraclecloud::DatabaseMixin

		def provision
			@instance = connection.instances.create(init_config)
		end

		def wait
			fog.wait_for { ready? }
		end

		def provider
			"OracleCloud"
		end

		def cloud_type
			"Database"
		end

		def fog
			@instance ||= connection.instances.get(name)
			@instance
		end

		def attr_get(attribute)
			begin
				@instance ||= connection.instances.get(name)
				@instance.attributes[attribute.to_sym]
			rescue Fog::OracleCloud::Database::NotFound
				"Error"
			end
		end

		def month_cost
			cost = calculate_monthly_cost(init_config)
      cost
		end

		def calc_cost(start_date, end_date)
			cost = 0
			cost = (end_date - start_date) * (month_cost / 30)
			cost
		end

		def connection 
	 		@connection ||= Fog::OracleCloud::Database.new(
	      :oracle_username => CpOraclecloud.username,
	      :oracle_password => CpOraclecloud.password,
	      :oracle_domain => CpOraclecloud.domain,
	      :oracle_region => CpOraclecloud.region
	      )
		end

	end
end
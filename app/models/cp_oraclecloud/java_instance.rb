module CpOraclecloud
  class JavaInstance < CloudInstance

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
			"Java"
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
			cost = 0
			cost
		end

		def calc_cost(start_date, end_date)
			cost = 0
			cost = (end_date - start_date) * (month_cost / 30)
			cost
		end

		def connection 
	 		@connection ||= Fog::OracleCloud::Java.new(
	      :oracle_username => CpOraclecloud::FOG_CONFIG[:oracle_username],
	      :oracle_password => CpOraclecloud::FOG_CONFIG[:oracle_password],
	      :oracle_domain => CpOraclecloud::FOG_CONFIG[:oracle_domain],
	      :oracle_region => CpOraclecloud::FOG_CONFIG[:oracle_region],
	      )
		end

	end
end
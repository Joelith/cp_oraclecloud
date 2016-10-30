module CpOraclecloud
	module ComputeMixin
		def calculate_monthly_cost(config)
			CpOraclecloud.rate_card[:compute]['hourly'] * 24 * 30		
		end
	end
end

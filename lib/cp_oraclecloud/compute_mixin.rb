module CpOraclecloud
	module ComputeMixin
		def calculate_monthly_cost(override=nil)
			if override.nil? then override = config end
			CpOraclecloud.rate_card[:compute]['hourly'] * 24 * 30		
		end
	end
end

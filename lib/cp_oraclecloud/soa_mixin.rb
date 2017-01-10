module CpOraclecloud
	module SoaMixin
		def calculate_monthly_cost(override=nil)
			if override.nil? then override = config end
			cost = 0
			if override['topology'] == 'mft' then cost = CpOraclecloud.rate_card[:soa]['mft']
			elsif override['topology'] == 'apim' then cost = CpOraclecloud.rate_card[:soa]['api']
			else cost = CpOraclecloud.rate_card[:soa]['full'] end
	    cost
		end
	end
end



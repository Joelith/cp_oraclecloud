module CpOraclecloud
	module SoaMixin
		def calculate_monthly_cost(config)
			cost = 0
			if config['topology'] == 'mft' then cost = CpOraclecloud.rate_card[:soa]['mft']
			elsif config['topology'] == 'apim' then cost = CpOraclecloud.rate_card[:soa]['api']
			else cost = CpOraclecloud.rate_card[:soa]['full'] end
	    cost
		end
	end
end



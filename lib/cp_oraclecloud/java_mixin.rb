module CpOraclecloud
	module JavaMixin
		def calculate_monthly_cost(config)
			if %w(oc3 oc4 oc5 oc6).include? config['shape'] 
	    	# General Compute
	    	rates = CpOraclecloud.rate_card[:java]['general']
	    else 
	    	# High Memory
	    	rates = CpOraclecloud.rate_card[:java]['high']
	    end
	    case config['edition']
	    when 'SE'
	    	edition_rate = rates['standard']
	    when 'EE'
	    	edition_rate = rates['enterprise']
	    when 'Suite'
	    	edition_rate = rates['suite']
	    end
	    if config['subscription_type'] == 'MONTHLY' then cost = edition_rate['monthly']
	    else cost = 30 * 24 * edition_rate['hourly'] end
	    cost = cost * config['num_nodes'].to_f
	    cost
		end
	end
end



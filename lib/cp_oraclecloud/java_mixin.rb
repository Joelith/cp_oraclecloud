module CpOraclecloud
	module JavaMixin
		def calculate_monthly_cost(override=nil)
			if override.nil? then override = config end
			if %w(oc3 oc4 oc5 oc6).include? override['shape'] 
	    	# General Compute
	    	rates = CpOraclecloud.rate_card[:java]['general']
	    else 
	    	# High Memory
	    	rates = CpOraclecloud.rate_card[:java]['high']
	    end
	    case override['edition']
	    when 'SE'
	    	edition_rate = rates['standard']
	    when 'EE'
	    	edition_rate = rates['enterprise']
	    when 'Suite'
	    	edition_rate = rates['suite']
	    end
	    if override['subscription_type'] == 'MONTHLY' then cost = edition_rate['monthly']
	    else cost = 30 * 24 * edition_rate['hourly'] end
	    cost = cost * override['num_nodes'].to_f
	    cost
		end
	end
end



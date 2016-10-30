module CpOraclecloud
	module DatabaseMixin
		def calculate_monthly_cost(config)
			cost = 0
			if %w(oc3 oc4 oc5 oc6).include? config['shape'] 
	    	# General Compute
	    	rates = CpOraclecloud.rate_card[:database]['general']
	    else 
	    	# High Memory
	    	rates = CpOraclecloud.rate_card[:database]['high']
	    end
	    case config['edition']
	    when 'SE'
	    	edition_rate = rates['standard']
	    when 'EE'
	    	edition_rate = rates['enterprise']
	    when 'EE_HP'
	    	edition_rate = rates['hp']
	    when 'EE_XP'
	    	edition_rate = rates['xp']
	    end
				if config['subscription_type'] == 'MONTHLY' then cost = edition_rate['monthly']
	    else cost = 30 * 24 * edition_rate['hourly'] end
	    cost
		end
	end
end
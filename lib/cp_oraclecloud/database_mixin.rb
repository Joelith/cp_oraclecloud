module CpOraclecloud
	module DatabaseMixin
		def calculate_monthly_cost(override=nil)
			if override.nil? then override = config end
			cost = 0
			if %w(oc3 oc4 oc5 oc6).include? override['shape'] 
	    	# General Compute
	    	rates = CpOraclecloud.rate_card[:database]['general']
	    else 
	    	# High Memory
	    	rates = CpOraclecloud.rate_card[:database]['high']
	    end
	    case override['edition']
	    when 'SE'
	    	edition_rate = rates['standard']
	    when 'EE'
	    	edition_rate = rates['enterprise']
	    when 'EE_HP'
	    	edition_rate = rates['hp']
	    when 'EE_XP'
	    	edition_rate = rates['xp']
	    end
				if override['subscription_type'] == 'MONTHLY' then cost = edition_rate['monthly']
	    else cost = 30 * 24 * edition_rate['hourly'] end
	    cost
		end
	end
end
class CpOraclecloud::AdminController < ApplicationController
	def dashboard
		@ssh_keys = policy_scope(CpOraclecloud::SshKey)
		@images = policy_scope(CpOraclecloud::Image)
		@instances = CloudInstance.eager_load(environment: :project).where("type LIKE :prefix", prefix: "CpOraclecloud%")
	
		@totals = {
			:database => {:total => 0, :cost=>0},
			:java => {:total => 0, :cost=>0},
			:soa => {:total => 0, :cost=>0},
			:compute => {:total => 0, :cost=>0}
		}
		@instances.each do |i|
			key = nil
			case i.type
			when "CpOraclecloud::DatabaseInstance"
				key = :database
			when "CpOraclecloud::JavaInstance"
				key = :java
			when "CpOraclecloud::SoaInstance"
				key = :soa
			when "CpOraclecloud::ComputeInstance"
				key = :compute
			end
			if key 
				@totals[key.to_sym][:total] += 1	
				@totals[key.to_sym][:cost] += i.calc_cost(i.environment.start_date, i.environment.end_date)
			end
		end
	end
end

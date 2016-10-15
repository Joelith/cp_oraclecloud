module CpOraclecloud
	class DatabaseInstancesController < CloudInstancesController

		def backup
	  	instance = CloudInstance.find(params[:database_instance_id])
			instance.fog.backup()
			flash[:notice] = "Backup has been requested"
			redirect_to request.referrer
		end
	end
end

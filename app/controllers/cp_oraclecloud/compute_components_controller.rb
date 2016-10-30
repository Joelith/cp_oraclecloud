module CpOraclecloud
	class ComputeComponentsController < CloudComponentsController

		private
		def component_params
		  params.require(:cp_oraclecloud_compute_component).permit(:name, :shape, :imagelist, :label, :sshkeys)
		end
	end
end
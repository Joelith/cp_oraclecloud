module CpOraclecloud
	class SoaComponentsController < CloudComponentsController

		private
		def component_params
		  params.require(:cp_oraclecloud_soa_component).permit(:service_name, :cloud_storage_container, :cloud_storage_pwd, :cloud_storage_user, :description, :provision_otd, :subscription_type, :level, :topology, :admin_password, :admin_username, :dba_name, :dba_password, :db_service_name, :num_nodes, :shape, :ssh_key, :version)
		end
	end
end
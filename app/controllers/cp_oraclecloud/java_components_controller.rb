module CpOraclecloud
	class JavaComponentsController < CloudComponentsController

		private
		def component_params
		  params.require(:cp_oraclecloud_java_component).permit(:service_name, :cloud_storage_container, :cloud_storage_pwd, :cloud_storage_user, :cloud_storage_if_missing, :description, :enable_admin_console, :provision_otd, :sample_app_deployment_requested, :subscription_type, :level, :admin_password, :admin_port, :admin_username, :backup_volume_size, :cluster_name, :content_port, :dba_name, :dba_password, :db_service_name, :wls_deployment_channel_port, :domain_mode, :domain_name, :domain_partition_count, :domain_volume_size, :edition, :num_nodes, :ms_initial_heap_mb, :ms_jvm_args, :ms_max_heap_mb, :ms_max_perm_mb, :node_manager_password, :node_manager_port, :node_manager_username, :overwrite_ms_jvm_args, :pdb_name, :secured_admin_port, :secured_content_port, :shape, :ssh_key, :version)
		end
	end
end
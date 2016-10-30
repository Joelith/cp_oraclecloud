Rails.application.routes.draw do
	resources :products do
		namespace :cp_oraclecloud do
			resources :database_components, type: 'CpOraclecloud::DatabaseComponent'
			resources :java_components, type: 'CpOraclecloud::JavaComponent'
			resources :soa_components, type: 'CpOraclecloud::SoaComponent'
			resources :compute_components, type: 'CpOraclecloud::ComputeComponent'
		end
	end

	namespace :cp_oraclecloud do
		resources :database_instances, type: 'CpOraclecloud::DatabaseInstance' do
			put :backup
		end
		resources :java_instances, type: 'CpOraclecloud::JavaInstance' do
			put :backup
		end
		resources :soa_instances, type: 'CpOraclecloud::SoaInstance'
		resources :compute_instances, type: 'CpOraclecloud::SoaInstance'
		resources	:ssh_keys
	end
end

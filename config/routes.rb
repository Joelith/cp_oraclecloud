Rails.application.routes.draw do
	resources :products do
		namespace :cp_oraclecloud do
			resources :database_components, type: 'CpOraclecloud::DatabaseComponent'
		end
	end

	namespace :cp_oraclecloud do
		resources :database_instances, type: 'CpOraclecloud::DatabaseInstance' do
			put :backup
		end
	end
end

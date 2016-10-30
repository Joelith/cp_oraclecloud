module CpOraclecloud
	class SshKeysController < ApplicationController
		before_action :set_ssh_key, only: [:show, :edit, :update, :destroy]

		def index
			authorize SshKey
			@ssh_keys = policy_scope(SshKey)
		end

		def new
			authorize SshKey
			@ssh_key = CpOraclecloud::SshKey.new
		end

		def show
			authorize @ssh_key
		end

		def create
			authorize SshKey
		  @ssh_key = SshKey.new(ssh_key_params)

		  if @ssh_key.save
		    flash[:notice] = "SSH Key has been created."
		    redirect_to cp_oraclecloud_ssh_keys_path
		  else
	  	  flash.now[:alert] = "SSH Key has not been created."
		    render "new"
		  end
		end

		def edit
			authorize @ssh_key
		end

		def destroy
			authorize @ssh_key
			@ssh_key.destroy
	  	flash[:notice] = "SSH Key has been deleted."

	  	redirect_to cp_oraclecloud_ssh_keys_path
		end

		def update
			authorize @ssh_key
			if @ssh_key.update_attributes(ssh_key_params)
				flash[:notice] = "SSH Key has been updated."
				redirect_to cp_oraclecloud_ssh_keys_path
			else
				flash.now[:alert] = "SSH Key has not been updated."
				render "edit"
			end
		end

		private

		def set_ssh_key
		  @project = CpOraclecloud::SshKey.find(params[:name])
		rescue ActiveRecord::RecordNotFound
		  flash[:alert] = "The SSH Key you were looking for could not be found."
		  redirect_to cp_oraclecloud_ssh_keys_path
		end

		def ssh_key_params
	  	params.require(:cp_oraclecloud_ssh_key).permit(:name, :enabled, :key)
		end
	end
end

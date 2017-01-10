module CpOraclecloud
	class ImagesController < ApplicationController
		before_action :set_image, only: [:edit, :update, :destroy]

		def index
			authorize Image
			@images = CpOraclecloud::Image.all
		end

		def new
			authorize Image
			@image = CpOraclecloud::Image.new
		end

		#def show
		#	authorize @ssh_key
		#end

		def create
			authorize Image
		  @image = Image.new(image_params )

		  if @image.valid?
		  	image = Image.create(image_params )
		    flash[:notice] = "Image has been created."
		    redirect_to cp_oraclecloud_admin_path
		  else
	  	  flash.now[:alert] = "Image has not been created."
		    render "new"
		  end
		end

		def edit
			#authorize @image
		end

		def destroy
			authorize @image
			#@image.destroy
			Image.delete(@image.id)
	  	flash[:notice] = "Image has been deleted."

	  	redirect_to cp_oraclecloud_admin_path
		end

		def update
			authorize @image
			if @image.update(image_params)
				flash[:notice] = "Image has been updated."
				redirect_to cp_oraclecloud_admin_path
			else
				flash.now[:alert] = "Image has not been updated."
				render "edit"
			end
		end

		private

		def set_image
		  @image = CpOraclecloud::Image.find_by_id(params[:id])
		rescue ActiveRecord::RecordNotFound
		  flash[:alert] = "The Image you were looking for could not be found."
		  redirect_to cp_oraclecloud_admin_path
		end

		def image_params
	  	params.require(:cp_oraclecloud_image).permit(:name, :default, :description)
		end
	end
end

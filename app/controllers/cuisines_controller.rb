class CuisinesController < ApplicationController

	before_action :authenticate_user!
	load_and_authorize_resource
    

	def index
		@cuisines = Cuisine.all
	end

	def new
		@cuisine = Cuisine.new
	end

	def create
		@cuisine = Cuisine.new(cuisine_params)
		if @cuisine.save
			redirect_to cuisines_path notice: "Successfully created"
		else
			render action: "new"
		end
	end

	def show
    	@cuisine = Cuisine.find(params[:id])
    	rescue ActiveRecord::RecordNotFound
	    redirect_to cuisines_path, notice: "Record Not Found"
    	
    end

    def edit
		@cuisine = Cuisine.find(params[:id])
    end

	def update
		@cuisine = Cuisine.find(params[:id])
		if @cuisine.update_attributes(cuisine_params)
		 	redirect_to cuisine_path(@cuisine), notice:"successfully updated"
    	else
    		render action: "edit"
    	end
	end

	def destroy
		@cuisine = Cuisine.find(params[:id])
		@cuisine.destroy
		redirect_to cuisine_path, notice: "successfully destroyed"
	end

	private

	def cuisine_params
		params[:cuisine].permit(:name)
	end


end

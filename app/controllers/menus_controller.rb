class MenusController < ApplicationController

	before_action :authenticate_user! 
    load_and_authorize_resource
    
    
	def index 
		@menus = Menu.all
    end

    def new
    	@menu = Menu.new
        @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def create
    	@menu = Menu.new(menu_params)
    	#@menu.user_id = current_user.id
        @menu.restaurant_id = params[:restaurant_id]
    	if @menu.save
    		redirect_to restaurant_path(@menu.restaurant_id), notice: "successfully created"
    	else
    		render action: "new"
    	end
    end

    def show
        @menu = Menu.find(params[:id])
    end

    private

    def menu_params
    	params[:menu].permit(:name, :restaurant_id, :cuisine_id, :price, :menutype_id)
    end
end
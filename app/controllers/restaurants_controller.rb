class RestaurantsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]
    load_and_authorize_resource
    

	def index 
		@restaurants = Restaurant.all
    end

    def new
    	@restaurant = Restaurant.new
    end

    def create
    	@restaurant = Restaurant.new(restaurant_params)
        @menu = Menu.new
    	if @restaurant.save
    		redirect_to restaurants_path, notice: "successfully created"
    	else
    		render action: "new"
    	end
    end

    def show
        @review = Review.new
        @menu = Menu.new
        @restaurant = Restaurant.find(params[:id])
        @reviews = @restaurant.reviews
        sum = 0
        @reviews.each do |r|
            sum = sum + r.rating 
        end
        if !(@restaurant.reviews.count == 0)
            @avg = sum / @restaurant.reviews.count
	        menus = @restaurant.menus
        end
    end

    def edit
		@restaurant = Restaurant.find(params[:id])
    end

	def update
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.update_attributes(restaurant_params)
		 	redirect_to restaurant_path(@restaurant), notice:"successfully updated"
    	else
    		render action: "edit"
    	end
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		redirect_to restaurants_path, notice: "successfully destroyed"
	end

    private

    def restaurant_params
    	params[:restaurant].permit(:name, :cover, :city_id, :location_id, :mobile, :user_id, :cost_for_two, cuisine_ids: [])
    end 
end



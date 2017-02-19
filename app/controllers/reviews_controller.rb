class ReviewsController < ApplicationController

    before_action :authenticate_user! 
    load_and_authorize_resource
    
    
	def index 
		@reviews = Review.all
    end

    def new
    	@review = Review.new
    end

    def create
    	@review = Review.new(review_params)
    	@review.user_id = current_user.id
    	if @review.save
    		redirect_to restaurant_path(@review.restaurant_id), notice: "successfully created"
    	else
    		render action: "new"
    	end
    end

    def show
        @review = Review.find(params[:id])
    end

    def edit
		@review = Review.find(params[:id])
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to restaurant_path(@review.restaurant_id), notice: "successfully destroyed"
    end

    private

    def review_params
    	params[:review].permit(:restaurant_id, :user_id, :comment, :rating)
    end
end


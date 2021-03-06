class RestaurantsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

	def create
		@restaurant = current_user.restaurants.build(restaurant_params)
		if @restaurant.save
			flash[:success] = "Restaurant created!"
			redirect_to root_url
		else
			render 'common/home'
		end
	end

	def destroy
	end

	def edit
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@courses = @restaurant.courses
		@course = Course.new
		@tables = @restaurant.tables
		@table = Table.new
		@bills = @restaurant.bills
		@bill = Bill.new
	end

	private

	def restaurant_params
		params.require(:restaurant).permit(:name)
	end

end
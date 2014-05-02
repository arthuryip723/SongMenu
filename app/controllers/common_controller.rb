class CommonController < ApplicationController
  def home
  	if signed_in?
  		@restaurants = current_user.restaurants
      @restaurant = Restaurant.new
      # @restaurant = current_user.restaurants.new
  		# @restaurants = current_user.shown_restaurants
  		# @restaurant = current_user.restaurants.build
  	end
  end

  def help
  end

  def contact
  end

  def about
  end
end

class CommonController < ApplicationController
  def home
  	if signed_in?
  		@restaurants = current_user.restaurants
      @restaurant = Restaurant.new
      case current_user.role
      when 'manager'
      when 'cook'
        @tables = current_user.restaurant.tables
      end
  	end
  end

  def help
  end

  def contact
  end

  def about
  end
end

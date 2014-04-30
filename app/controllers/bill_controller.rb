class BillController < ApplicationController
	before_action :signed_in_user, only: [:new, :destroy, :show]
	before_action :correct_user, only: [:destroy, :show]
  def new
  end

  def destroy
  end

  def show
  end

  def create
  	@restaurant = Restaurant.find(params[:restaurant_id])
  	@bill = @restaurant.bills.build(bill_params)
  	if (@bill.save)
  		#treat the two success separately
  		flash[:success] = "Bill created!"
  	else
  	end
  	redirect_to @restaurant
  end

  private 
  def correct_user
  	@bill = current_user.restaurants.find_by(id: params[:restaurant_id]).bills.find_by(id: params[:id])
  	redirect_to root_url if @bill.nil?
  end

  def bill_params
  	params.require(:bill)
  end
end

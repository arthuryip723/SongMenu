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
  	
  end

  private 
  def correct_user
  	@bill = current_user.restaurants.find_by(id: params[:restaurant_id]).bills.find_by(id: params[:id])
  	redirect_to root_url if @bill.nil?
  end
end

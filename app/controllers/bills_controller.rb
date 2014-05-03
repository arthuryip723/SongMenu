class BillsController < ApplicationController
	before_action :signed_in_user, only: [:new, :destroy, :show]
	# before_action :correct_user, only: [:destroy, :show]
  def new
  end

  def destroy
  end

  def show
  	@bill = Bill.find(params[:id])
  	@items = @bill.items
  	@item = Item.new
  	@courses = @bill.table.restaurant.courses
  end

  def create
  	# @restaurant = Restaurant.find(params[:restaurant_id])
  	# @bill = @restaurant.bills.build(bill_params)
  	@table = Table.find(params[:table_id])
  	@bill = @table.bills.build(bill_params)
  	# @bill = @table.bills.build()
  	if (@bill.save)
  		#treat the two success separately
  		flash[:success] = "Bill created!"
  	else
  	end
  	redirect_to @table
  end

  def update
  	@bill = Bill.find(params[:id])
  	# @table = @bill.table
  	if (@bill.update(bill_params))
  		flash[:success] = "Bill updated!"
  	end
  	redirect_to @bill
  end

  def add_item
  	@bill = Bill.find(params[:id])
  end

  private 
  def correct_user
  	@bill = current_user.restaurants.find_by(id: params[:restaurant_id]).bills.find_by(id: params[:id])
  	redirect_to root_url if @bill.nil?
  end

  def bill_params
  	params.require(:bill).permit(:status)
  end

end

class ItemsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	# we must make sure user is the owner of the bill
	before_action :correct_user, only: [:create, :destroy]
  def new
  end

  def create
  	@bill = Bill.find(params[:bill_id])
  	@item = @bill.items.build(bill_params)
  	if @item.save
  		flash[:success] = "Item created!"
  	else
  	end
  	redirect_to @bill
  end

  def destroy
  end

  private

  def bill_params
  	params.require(:item).permit(:status, :course_id)
  end

  def correct_user
  	@bill = Bill.find(params[:bill_id])
	if @bill.table.restaurant.user != current_user
		redirect_to root_url
	end
  end
end

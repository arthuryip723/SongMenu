class ItemsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	# we must make sure user is the owner of the bill
	before_action :correct_user, only: [:create, :destroy]
  def new
  end

  def create
  	@bill = Bill.find(params[:bill_id])
  	@item = @bill.items.build(item_params)
  	if @item.save
  		flash[:success] = "Item created!"
  	else
  	end
  	redirect_to @bill
  end

  def destroy
  end

  def update
  	@item = Item.find(params[:id])
  	if (@item.update(item_params))
  		flash[:sucess] = "Item updated!"
  	end
    respond_to do |format|
      if current_user.is?('cook')
        # redirect_to root_url
        destination = root_url
      else
        # redirect_to @item
        destination = @item
      end
      format.html { redirect_to destination}
      format.json { render :show, status: :ok}
    end

  end

  def show
  	@item = Item.find(params[:id])
  	@courses = @item.bill.table.restaurant.courses
  end

  private

  def item_params
  	params.require(:item).permit(:status, :course_id)
  end

  def correct_user
  	@bill = Bill.find(params[:bill_id])
	if @bill.table.restaurant.user != current_user
		redirect_to root_url
	end
  end
end

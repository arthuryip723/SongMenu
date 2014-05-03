class TablesController < ApplicationController
  def new
  end

  def create
  	# I should implement an auto increment here for the table no
  	@restaurant = Restaurant.find(params[:restaurant_id])
  	@table = @restaurant.tables.build(table_params)
  	if @table.save
  		flash[:success] = "Table created!"
  	else
  	end
  	redirect_to @restaurant
  end

  def show
  	@table = Table.find(params[:id])
  	@bills = @table.bills
  	@bill = Bill.new
  	@restaurant = @table.restaurant
  	# @courses = @restaurant.courses
  end

  def destroy
  end

  private

  def table_params
  	params.require(:table).permit(:no)
  end
end

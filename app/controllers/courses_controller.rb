class CoursesController < ApplicationController
  # attr_accessible :image
  def create
  	@restaurant = Restaurant.find(params[:restaurant_id])
  	@course = @restaurant.courses.build(course_params)
  	if @course.save
  		flash[:success] = "Course created!"
  	else
      flash[:error] = "Error!"
  	end
    redirect_to @restaurant
  end

  def destroy
  end

  def edit
  end

  private

  def course_params
  	params.require(:course).permit(:name, :price, :image)
  end

  def correct_user
    true
  end
end

class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  	@restaurants = @user.restaurants
  end

  def create
  	@user = User.new(user_params)
	if @user.save
	# if true
		sign_in @user
		flash[:success] = "Welcome to SongMenu!"
		redirect_to @user
  	else
	  	render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if (@user.update(user_params))
      flash[:success] = "User updated!"
    else
      flash[:success] = "User not updated!"
    end
    redirect_to @user
  end
end

private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
	end

  def user_params2
    params.require(:user).permit(:name, :email, :role)
  end
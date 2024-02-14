class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @users = User.all
    @city = user.city
    @gossips = user.gossips
    user
  end

  def edit
    user
  end

  def update
    user
    user.update(posts_params)
    redirect_to users_path
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(posts_params)
    redirect_to user_path(user.id)
  end

  def destroy
    user.destroy
    redirect_to users_path
  end

  private

  def user
    @user = User.find(params[:id])
  end

  def posts_params
    params.require(:user).permit(:first_name, :last_name, :age, :email, :city_id)
  end

end

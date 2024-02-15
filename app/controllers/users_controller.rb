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
    user = User.new(posts_params)
    if user.save
      flash[:success] = "User created successfully!"
      redirect_to new_session_path

    else
      redirect_to new_user_path
    end
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
    params.require(:user).permit(:first_name, :last_name, :description, :age, :email, :email_confirmation, :city_id, :password, :password_confirmation)
  end

end

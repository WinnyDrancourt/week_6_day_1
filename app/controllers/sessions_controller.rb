class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in(user)
      flash[:success] = "Logged in successfully!"
      redirect_to '/gossips'
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:sucess] = "Logged out succesfully!"
    redirect_to '/gossips'
  end
end

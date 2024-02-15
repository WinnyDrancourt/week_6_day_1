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
    log_out
    redirect_to root_url, notice: "Logged out successfully!"
  end
end

class UserController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def Create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end

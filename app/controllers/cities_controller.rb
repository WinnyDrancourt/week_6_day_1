class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @gossips = Gossip.where(:user => User.where(city_id: params[:id]))
  end

end

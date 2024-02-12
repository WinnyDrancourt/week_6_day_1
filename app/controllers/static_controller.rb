class StaticController < ApplicationController
  def welcome
    @first_name = params[:first_name]
    @gossip = Gossip.all
  end
  
  def team
  end

  def contact
  end
end

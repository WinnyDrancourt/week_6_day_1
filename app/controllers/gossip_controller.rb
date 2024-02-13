class GossipController < ApplicationController

  def index
    @gossip = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @user = Gossip.find(params[:id]).user.id
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

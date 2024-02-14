class GossipsController < ApplicationController
  
  def index
    @gossips = Gossip.all

  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    gossip = Gossip.create(gossip_params)
    redirect_to gossip_path(gossip.id)
  end

  def edit
    @gossip = Gossip.find(params[:id])


  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(gossip_params)
    redirect_to gossip_path
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path

  end

private

  def gossip_params
    params.require(:gossip).permit(:user_id, :title, :content)
  end

end

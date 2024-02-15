class GossipsController < ApplicationController

  def index
    @gossips = Gossip.all

  end

  def show
    @gossip = gossip
    @user = gossip.user
    @city = @user.city
    @comments = Comment.where(gossip_id: params[:id]).all
    @comment = Comment.new
  end

  def new
    @gossip = Gossip.new
  end

  def create
    gossip = Gossip.create(gossip_params)
    redirect_to gossip_path(gossip.id)
  end

  def edit
    gossip
  end

  def update
    gossip
    if @gossip.update(gossip_params)
      redirect_to gossip_path
    else
      render :edit
    end
  end

  def destroy
    gossip
    @gossip.destroy
    redirect_to gossips_path

  end

private

  def gossip
    Gossip.find(params[:id])
  end


end

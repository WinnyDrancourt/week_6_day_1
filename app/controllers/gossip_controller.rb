class GossipController < ApplicationController

  def index
    @gossip = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @user = Gossip.find(params[:id]).user.id
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.create(user_id: User.all.shuffle.first.id, title: params[:title], content: params[:content])
    if @gossip.save
      puts "potin créé"
      redirect_to '/'
    else
      puts "Error : completez correctement svp"
      render 'gossip/new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end

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
      @gossip = Gossip.new(user_id: User.all.shuffle.first.id, title: params[:title], content: params[:content])
      if @gossip.save
        puts "potin créé"
        flash[:notice] = "Opération réussie !"
        redirect_to '/'
      else
        puts "Error : completez correctement svp"
        render 'new'
      end
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
    
    @gossip.destroy
    redirect_to root_path
  end

private

  def set_gossip
    @gossip = Gossip.find(params[:id])
  end

  def gossip_params
    gossip_params = params.require(:gossip).permit(:title, :content)
  end

  

end

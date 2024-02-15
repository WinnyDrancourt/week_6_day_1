class GossipsController < ApplicationController
  before_action :set_gossip, only: [:edit, :update, :destroy]
  before_action :gossip, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:new, :create, :show]
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
    @tags = Tag.all
  end

  def create
    @gossip = Gossip.create(gossip_params)
    @gossip.user = current_user
    if @gossip.save
      flash[:success] = "Potin bien créé !"
      redirect_to @gossip
    else
      render :new
    end
  end

  def edit
     unless current_user && current_user == @gossip.user
      flash[:success] = "Pas autorisé !"
      redirect_to gossip_path(gossip.id)
      return
    end
  end

  def update
    unless current_user && current_user == @gossip.user
      flash[:success] = "Pas autorisé !"
      redirect_to gossip_path(gossip.id)
      return
    end

    if @gossip.update(gossip_params)
      redirect_to gossip_path(gossip.id), notice: 'Potin mis à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    gossip
    gossip.destroy
    redirect_to gossips_path

  end

private

def set_gossip
  @gossip = Gossip.find(params[:id])
end

  def gossip
    Gossip.find(params[:id])
  end

  def gossip_params
    params.require(:gossip).permit(:title, :content, :user_id)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end


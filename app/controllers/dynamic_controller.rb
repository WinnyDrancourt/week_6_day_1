class DynamicController < ApplicationController

  def welcome
    @first_name = params[:first_name]
    @gossip = Gossip.all
  end

  def user
    @user = User.find(params[:id])
    @gossip_count = Gossip.where(user_id: User.find(params[:id])).count
    @comment_count = Comment.where(user_id: User.find(params[:id])).count
  end

  def gossip
    @user = Gossip.find(params[:id]).user.id
    @gossip = Gossip.find(params[:id])
    @comment = Comment.where(gossip_id: Gossip.find(params[:id]))
  end

end

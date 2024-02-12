class StaticController < ApplicationController
  def welcome
    @first_name = params[:first_name]
  end

  def team
  end

  def contact
  end

  def users
    @user = User.find(params[:id])
    @gossip_count = Gossip.where(user_id: User.find(params[:id])).count
    @comment_count = Comment.where(user_id: User.find(params[:id])).count
  end
end

class LikesController < ApplicationController

  def create
    @like = current_user.likes.new(like_params)
    if !@like.save
      flash[:notice] = @like.errors.full_message.to_sentence
    end
    redirect_to @like.gossip
  end

  def destroy
    @like = Like.find(params[:id])
    gossip = @like.gossip
    @like.destroy
    redirect_to gossip
  end

  private

  def like_params
    params.require(:like).permit(:gossip_id)
  end
end

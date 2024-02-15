class CommentsController < ApplicationController

  def edit
  end

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.create(comment_params)
    redirect_to gossip_path(@gossip.id)
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@gossip.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :gossip_id, :content)
  end
end

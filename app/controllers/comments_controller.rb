class CommentsController < ApplicationController
  before_action :gossip_id, only: [:edit, :update, :create, :destroy]

  def edit
    comment
  end

  def update
    @comment = @gossip.comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to gossip_path(@gossip.id)
  end

  def create
    @parent = @comment
    @comment = Comment.create(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "commentaire bien créé !"
      redirect_to gossip_path(@gossip.id)
    else
      render :new
    end
  end

  def destroy
    comment
    @comment.destroy
    redirect_to gossip_path(@gossip.id)
  end

  private

  def comment
    @comment = Comment.find(params[:id])
  end

  def gossip_id
    @gossip = Gossip.find(params[:gossip_id])
  end


  def comment_params
    params.require(:comment).permit(:user_id, :gossip_id, :content)
  end
end

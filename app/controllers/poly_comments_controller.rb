class PolyCommentsController < ApplicationController

  before_action :set_commentable

  def create
    @poly_comment = @commentable.poly_comments.build(poly_comment_params)
    @poly_comment.user = current_user

    if @poly_comment.save
      redirect_to commentable_path(@commentable), notice: 'Comment created successfully.'
    else
      render 'commentables/show'
    end
  end

  def destroy
    @poly_comment = PolyComment.find(params[:id])
    @poly_comment.destroy
    redirect_to commentable_path(@commentable), notice: 'Comment deleted successfully.'
  end

  private

  def set_commentable
    @commentable = Gossip.find(params[:gossip_id]) if params[:gossip_id]
  end

  def poly_comment_params
    params.require(:poly_comment).permit(:content)
  end

end

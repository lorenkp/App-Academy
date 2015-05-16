class CommentsController < ApplicationController
  def new
    @comment = Comment.new(post_id: params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.save
    redirect_to post_url(comment_params[:post_id])
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end

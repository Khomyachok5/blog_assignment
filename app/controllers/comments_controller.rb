class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @comment = 
    if params[:article_id]
      Article.find(params[:article_id])
    elsif params[:comment_id]
      Comment.find(params[:comment_id])
    end

    @comment.comments.new(comment_params)
    
    unless @comment.save
      flash.alert = @comment.errors.full_messages.join('. ')
    end
      redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end  
end

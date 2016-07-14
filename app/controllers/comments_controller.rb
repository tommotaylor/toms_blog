class CommentsController < ApplicationController
  before_action :set_commentable

  def create
    comment = Comment.new(comment_params)
    comment.commentable = @commentable
    if comment.save
      flash[:success] = "Your comment was saved"
      redirect_to comment.commentable
    else
      flash[:danger] = "Comment and username required"
      redirect_to :back
    end
  end

  private

  def set_commentable
    klass = [Article, Post].detect { |c| params["#{c.name.underscore}_id"] }
    @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end

  def comment_params
    params.require(:comment).permit(:body, :user)
  end
end

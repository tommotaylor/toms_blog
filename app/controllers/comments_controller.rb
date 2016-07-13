class CommentsController < ApplicationController
  before_action :require_login
  def create
    comment = Comment.new(comment_params)
    comment.commentable = post
    comment.user = current_user
    if comment.save
      flash[:success] = "Your comment was saved"
      redirect_to post_path(post)
    else
      flash[:danger] = "Your comment was not saved"
      redirect_to :back
    end
  end

  private

  def post
    @post ||= Post.find_by(id: params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end

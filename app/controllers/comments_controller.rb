class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html do
        if @comment.valid?
          redirect_to @comment.commentable, flash: { success: "Comment saved" }
        else
          redirect_to :back, flash: { danger: "Comment and username required" }
        end
      end
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :body, :user, :commentable_type, :commentable_id
    )
  end
end

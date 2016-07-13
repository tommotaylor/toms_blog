class PostsController < ApplicationController
  def index
    render :index, locals: { posts: posts }
  end

  def show
    render :show, locals: { post: post, comment: comment }
  end

  private

  def posts
    @posts ||= Post.includes(:comments)
  end

  def post
    @post ||= Post.find_by(id: params[:id])
  end

  def comment
    @comment ||= Comment.new
  end
end

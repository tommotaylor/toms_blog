class PostsController < ApplicationController
  def index
    render :index, locals: { posts: posts }
  end

  def show
    render :show, locals: { post: post }
  end

  private

  def posts
    @posts ||= Post.all
  end

  def post
    @post ||= Post.find_by(id: params[:id])
  end
end

class PostsController < ApplicationController
  def new
    render :new, locals: { post: Post.new }
  end

  def create
    post = Post.new(post_params)
    if post.save
      params[:post][:tag_ids].reject(&:blank?).each do |tag_id|
        Tagging.create(taggable: post, tag_id: tag_id)
      end
      redirect_to post_path(post)
    else
      render :new, locals: { post: post }
    end
  end

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

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

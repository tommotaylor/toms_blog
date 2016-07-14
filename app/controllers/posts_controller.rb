class PostsController < ApplicationController
  def new(options = {})
    render :new, locals: { post: Post.new }.merge(options)
  end

  def create
    post = Post.new(post_params)
    if post.save
      params[:post][:tagging_ids].reject(&:blank?).each do |tag_id|
        Tagging.create(taggable: post, tag_id: tag_id)
      end
      redirect_to post_path(post), notice: "Post saved"
    else
      new notice: "Post not saved"
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

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
    respond_to do |format|
      format.html do
        render :show,
          locals: { post: post, comments: comments, comment: comment }
      end
      @comments = comments
      format.js { render "shared/load_comments" }
    end
  end

  private

  def posts
    @posts ||= Post.all.page params[:page]
  end

  def post
    @post ||= Post.find_by(id: params[:id])
  end

  def comment
    @comment ||= Comment.new
  end

  def comments
    @comments ||= post.comments.page params[:page]
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

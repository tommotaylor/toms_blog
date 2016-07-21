class ArticlesController < ApplicationController
  def new
    render :new, locals: { article: Article.new }
  end

  def create
    article = Article.new(article_params)
    if article.save
      params[:article][:tag_ids].reject(&:blank?).each do |tag_id|
        Tagging.create(taggable: article, tag_id: tag_id)
      end
      redirect_to article_path(article)
    else
      render :new, locals: { article: article }
    end
  end

  def index
    render :index, locals: { articles: articles }
  end

  def show
    respond_to do |format|
      format.html do
        render :show,
          locals: { article: article, comments: comments, comment: comment }
      end
      @comments = comments
      format.js { render "shared/load_comments" }
    end
  end

  private

  def articles
    @articles ||= Article.all.page params[:page]
  end

  def article
    @article ||= Article.find_by(id: params[:id])
  end

  def comment
    @comment ||= Comment.new
  end

  def comments
    @comments ||= article.comments.page params[:page]
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end

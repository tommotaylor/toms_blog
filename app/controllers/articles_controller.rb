class ArticlesController < ApplicationController
  def new(options = {})
    render :new, locals: { article: Article.new }.merge(options)
  end

  def create
    article = Article.new(article_params)
    if article.save
      params[:article][:tag_ids].reject(&:blank?).each do |tag_id|
        Tagging.create(taggable: article, tag_id: tag_id)
      end
      redirect_to article_path(article), notice: "Article saved"
    else
      new notice: "Article not saved"
    end
  end

  def index
    render :index, locals: { articles: articles }
  end

  def show
    render :show, locals: { article: article, comment: comment }
  end

  private

  def articles
    @articles ||= Article.includes(:comments)
  end

  def article
    @article ||= Article.find_by(id: params[:id])
  end

  def comment
    @comment ||= Comment.new
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end

class ArticlesController < ApplicationController
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
end

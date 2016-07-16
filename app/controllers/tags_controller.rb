class TagsController < ApplicationController
  def show
    render :show, locals: { tag: tag, taggables: taggables }
  end

  private

  def tag
    @tag ||= Tag.find_by(slug: params[:id])
  end

  def taggables
    Tagging.includes(:tag, :taggable).where(tag: tag).collect(&:taggable)
  end
end

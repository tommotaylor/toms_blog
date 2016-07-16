class Tag < ApplicationRecord
  has_many :taggings
  has_many :posts, through: :taggings
  has_many :articles, through: :taggings

  before_save :create_slug

  def create_slug
    self.slug = name.parameterize
  end

  def to_param
    slug
  end
end

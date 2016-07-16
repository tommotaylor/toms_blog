class Article < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  validates :title, presence: true

  default_scope { order(created_at: :desc) }
end

class Post < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  validates :title, presence: true
end

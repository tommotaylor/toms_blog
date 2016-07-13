class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  validates :body, presence: true

  default_scope { order(created_at: :desc) }
end

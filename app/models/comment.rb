class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true, touch: true

  validates :body, presence: true
  validates :user, presence: true

  default_scope { order(created_at: :desc) }

  paginates_per 15
end

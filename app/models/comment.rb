class Comment < ActiveRecord::Base
  include Commentable
  validates :body, presence: true
  belongs_to :commentable, polymorphic: true
  validates :commentable_id, :commentable_type, presence: true
end

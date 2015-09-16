class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  include Commentable
  validates :title, :contents, presence: true, length: {minimum: 2}
  validates :title, uniqueness: {message: "An article with the same title already exists"}
end

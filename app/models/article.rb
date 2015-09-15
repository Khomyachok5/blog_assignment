class Article < ActiveRecord::Base
  include Commentable
  validates :title, :contents, presence: true, length: {minimum: 2}
  validates :title, uniqueness: {message: "An article with the same title already exists"}
end

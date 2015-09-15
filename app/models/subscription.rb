class Subscription < ActiveRecord::Base
  validates :email, presence: true, uniqueness: {message: "is already on the subscribers list"}, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "needs to be in the e-mail format"}
end

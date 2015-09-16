class AdminsController < ApplicationController

  def manage
    @users = User.order(created_at: :asc)
    @articles = Article.order(created_at: :asc)
    @admin_count = User.where(is_admin: true).count
  end
  
end

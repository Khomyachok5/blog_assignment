class ArticlesController < ApplicationController
  
  def index
    @articles_listing = Article.order(created_at: :asc)
  end


end

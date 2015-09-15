class ArticlesController < ApplicationController
  
  def index
    @articles_listing = Article.order(created_at: :asc)
  end

  def show
    @article = Article.find(params[:id])
  end


end

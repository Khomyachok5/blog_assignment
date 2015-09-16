class ArticlesController < ApplicationController
  include Permissions
  before_action :check_privileges, only: [:create, :new, :update, :edit, :destroy]
  before_action :find_article, only: [:show, :update, :edit, :destroy]

  def index
    @articles_listing = Article.order(created_at: :asc).page params[:page]
    @total_pages = @articles_listing.total_pages
  end

  def new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      flash.alert = @article.errors.full_messages.join('. ')
      redirect_to new_article_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @article.update_attributes(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :contents)
  end


  def find_article
    @article = Article.friendly.find(params[:id])
  end
end
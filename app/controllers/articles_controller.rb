class ArticlesController < ApplicationController
  include Permissions
  before_action :check_privileges, only: [:create, :new, :update, :edit, :destroy]
  before_action :find_article, only: [:update, :edit, :destroy]

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      flash.alert = @article.errors.full_messages.join('. ')
      redirect_to new_article_path
    end
  end

  def new
  end

  def index
    @articles_listing = Article.order(created_at: :asc)
  end

  def show
    @article = Article.find(params[:id])
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
    @article = Article.find(params[:id])
  end
end

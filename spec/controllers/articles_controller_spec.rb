require 'rails_helper'
require 'devise'

RSpec.describe ArticlesController, :type => :controller do

  describe "POST #create" do
  	context "with an existing admin account" do
      let!(:user) { FactoryGirl.create(:user) }
      let(:article) { FactoryGirl.build(:article) }
      before (:each) do
        sign_in user
        @article = post :create, article: {user: user, title: article.title, contents: article.contents}
      end
      
      it "creates a new article" do
        expect(Article.find_by(title: article.title)).to_not be_nil
      end
      
      it "redirects to #show" do
        expect(subject).to redirect_to(article_path(Article.last))
      end

      it "has a 302 status code" do
        expect(response.status).to eq(302)
      end
    end

    context "from an unauthorized user" do
      let!(:user) { FactoryGirl.create(:user) }
      let(:article) { FactoryGirl.build(:article) }
      let(:count) { Article.count }
      before (:each) do
      	count = Article.count
        sign_in nil
        post :create, article: {user: user, title: article.title, contents: article.contents}
      end
      
      it "does not create a new article" do
        expect(Article.count).to eq(count)
      end
    end
  end
end

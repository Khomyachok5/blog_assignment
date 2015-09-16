require 'rails_helper'

RSpec.describe Article, :type => :model do
  
  it "has title attribute" do
    article = FactoryGirl.create :article
    expect(Article.find_by(title: "Factory girl test article")).to eq(article)
  end

  it {is_expected.to validate_presence_of :title}
  it {is_expected.to validate_presence_of :contents}
  it {is_expected.to have_db_column(:title).of_type(:string)}
  it {is_expected.to have_db_column(:contents).of_type(:text)}
end

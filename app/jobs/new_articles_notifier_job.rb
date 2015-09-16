class NewArticlesNotifierJob < ActiveJob::Base
  queue_as :default

  def perform(article)
    Subscription.find_each do |s|
      Notifier.new_article(s.email, article).deliver_later
    end
  end
end

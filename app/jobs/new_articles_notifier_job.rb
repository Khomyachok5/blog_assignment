class NewArticlesNotifierJob < ActiveJob::Base
  queue_as :default

  def perform(article)
    @subscribers = Subscription.all
      @subscribers.each do |s|
      Notifier.new_article(s.email, article).deliver_later
    end
  end
end

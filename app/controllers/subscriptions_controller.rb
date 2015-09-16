class SubscriptionsController < ApplicationController
  def create
    new_subscription = Subscription.new(email: current_user.email)
    if new_subscription.save
      flash.notice = "You have successfully subscribed to the blog"
    else
      flash.alert = new_subscription.errors.full_messages.join('. ')
    end
    redirect_to root_path
  end

  def unsubscribe
    email = decrypt_message(params[:subscription_token])
    subscription = Subscription.find_by(email: email)
    if subscription != nil
      subscription.destroy
      flash.notice = "Your subscription has been cancelled"
    else
      flash.alert = subscription.errors.full_messages.join('. ')
    end
    redirect_to root_path
  end

  private

  def decrypt_message(message)
    salt  = ENV["SALT"]
    key   = ActiveSupport::KeyGenerator.new('keypass_phrase').generate_key(salt)
    crypt = ActiveSupport::MessageEncryptor.new(key)
    crypt.decrypt_and_verify(message)
  end
end

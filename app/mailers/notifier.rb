class Notifier < ApplicationMailer

  def new_article(email, article)
    @email = encrypt_message(email)
    @article = article
    mail(to: email, subject: 'A new article has been posted')
  end

  private

  def encrypt_message(message)
    salt  = ENV["SALT"]
    key   = ActiveSupport::KeyGenerator.new('keypass_phrase').generate_key(salt)
    crypt = ActiveSupport::MessageEncryptor.new(key)
    encrypted_data = crypt.encrypt_and_sign(message)
  end
end
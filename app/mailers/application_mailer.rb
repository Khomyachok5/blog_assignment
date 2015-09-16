class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@teamblog.com"
  layout 'mailer'
end

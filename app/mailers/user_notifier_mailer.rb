# Mailer that sends dummy mail to multiple recipients.
class UserNotifierMailer < ApplicationMailer
  default from: 'any_from_address@example.com'

  def send_signup_email(emails, content)
    @content = content
    mail(to: emails, subject: 'Thanks for signing up for our amazing app')
  end
end

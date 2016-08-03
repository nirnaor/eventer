# Used to send mail to users that exist in the database.
class MailWorker
  @queue = :mail
  def self.perform(emails, content)
    existing_emails = User.where(email: emails).pluck(:email)
    UserNotifierMailer.send_signup_email(existing_emails, content).deliver
  end
end

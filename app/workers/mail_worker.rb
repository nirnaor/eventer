# Used to send mail to users that exist in the database.
class MailWorker
  @queue = :mail
  def self.perform(emails, content)
    begin
      existing_emails = User.where(email: emails).pluck(:email)
      UserNotifierMailer.send_signup_email(existing_emails, content).deliver
    rescue StandardError => e
      # I should probably seperate the exceptions here to ActiveRecordError
      # and mail sending related error.
      Resque.enqueue(MailWorker, emails, content)
      raise e
    end
  end
end

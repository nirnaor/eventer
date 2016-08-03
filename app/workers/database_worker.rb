# Runs in the background and inserts new emails to users table.
class DatabaseWorker
  @queue = :db
  def self.perform(emails)
    # Pluck will load only the email field.
    existing_emails = User.where(email: emails).pluck(:email).to_set

    # Sets improve the difference calculation.
    new_emails = emails.to_set - existing_emails

    User.bulk_insert values: new_emails.map { |x| { email: x } }
  end
end

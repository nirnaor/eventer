class UsersController < ApplicationController
  def add
    emails = JSON.parse(params[:emails])

    # Pluck will load only the email field.
    existing_emails = User.where(email: emails).pluck(:email).to_set

    # Sets imrove the difference calculation.
    new_emails = emails.to_set - existing_emails

    User.bulk_insert values: new_emails.map {|x| {email: x}}
    render json: {users: new_emails.size}.to_json
    # UserNotifierMailer.send_signup_email.deliver
  end

  def send_mail
    render json: {users: 5}.to_json
  end
end

class UsersController < ApplicationController
  def add
    emails = JSON.parse(params[:emails])
    existing_emails = User.where(email: emails).pluck(:email).to_set
    new_emails = emails.to_set - existing_emails
    new_emails.each do |email|
      User.create(email: email)
    end
    render json: {users: new_emails.size}.to_json
    # UserNotifierMailer.send_signup_email.deliver
  end

  def send_mail
    render json: {users: 5}.to_json
  end
end

class UsersController < ApplicationController
  def add
    Resque.enqueue(DatabaseWorker, JSON.parse(params[:emails]))
    render json: {users: 5}.to_json
  end

  def send_mail
    emails, content = JSON.parse(params[:emails]), params[:content]
    existing_emails = User.where(email: emails).pluck(:email)
    UserNotifierMailer.send_signup_email(existing_emails, content).deliver
    render json: {users: 5}.to_json
  end
end

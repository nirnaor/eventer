class UsersController < ApplicationController
  def add
    render json: {users: 5}.to_json
    UserNotifierMailer.send_signup_email.deliver
  end

  def send_mail
    render json: {users: 5}.to_json
  end
end

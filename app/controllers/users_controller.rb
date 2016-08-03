class UsersController < ApplicationController
  def add
    render json: {users: 5}.to_json
  end

  def send_mail
    render json: {users: 5}.to_json
  end
end

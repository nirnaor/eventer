class UsersController < ApplicationController
  def add
    Resque.enqueue(DatabaseWorker, JSON.parse(params[:emails]))
    render json: {users: 5}.to_json
  end

  def send_mail
    Resque.enqueue(MailWorker, JSON.parse(params[:emails]), params[:content])
    render json: {users: 5}.to_json
  end
end

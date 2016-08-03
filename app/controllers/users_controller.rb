# The only controller for the API.
class UsersController < ApplicationController
  def add
    Resque.enqueue(DatabaseWorker, JSON.parse(params[:emails]))
    render json: { message: 'success' }
  end

  def send_mail
    Resque.enqueue(MailWorker, JSON.parse(params[:emails]), params[:content])
    render json: { message: 'success' }
  end
end

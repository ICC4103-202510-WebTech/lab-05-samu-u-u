class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end
  def show
    @message = Message.find(params[:id])
  end
  def new
    @message = Message.new
  end
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to @message, notice: 'Message created'
    else
      render :new
    end
  end
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end

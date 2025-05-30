class MessagesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
  end

  def show
  end

  def new
  end

  def create
    @message.user = current_user
    if @message.save
      redirect_to @message, notice: 'Message created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to @message, notice: 'Message updated'
    else
      render :edit
    end
  end

  def message_params
    params.require(:message).permit(:body, :chat_id)
  end
end

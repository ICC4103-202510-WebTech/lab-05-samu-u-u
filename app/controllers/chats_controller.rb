class ChatsController < ApplicationController
  def index
    @chats = Chat.all
  end
  def show
    @chat = Chat.find(params[:id])
  end
  def new
    @chat = Chat.new
  end
  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to @chat, notice: 'Chat created'
    else
      render :new
    end
  end
  def chat_params
    params.require(:chat).permit(:sender_id, :receiver_id)
  end

end

class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_room, only: [:create]
  

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(message_params)
        if @message.save
          @message = Message.new
          gets_entries_all_messages
        else
          render :"rooms/show"
        end
    else
      flash[:alert] = "メッセージの送信に失敗しました"
    end
  end

  private

  def set_room
      @room = Room.find(params[:message][:room_id])
  end

  def set_message
      @message = Message.find(params[:id])
  end

  def gets_entries_all_messages
      @messages = @room.messages.includes(:user).order("created_at asc")
  end

  def message_params
      params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id)
  end

end
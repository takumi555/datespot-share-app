class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_room, only: [:create]
  

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(message_params)
      @room = @message.room
      if @message.save
        @roommembernotme=Entry.where(room_id: @room.id).where.not(user_id: current_user.id)
        @theid=@roommembernotme.find_by(room_id: @room.id)
        notification = current_user.active_notifications.new(
            room_id: @room.id,
            message_id: @message.id,
            visited_id: @theid.user_id,
            visitor_id: current_user.id,
            action: 'dm'
        )
        if notification.visitor_id == notification.visited_id
            notification.checked = true
        end
        notification.save if notification.valid?
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
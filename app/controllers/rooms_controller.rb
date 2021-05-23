class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:create,:show]
  
  def index
    current_entries = current_user.entries
    my_room_ids = []
    current_entries.each do |entry|
      my_room_ids << entry.room.id
    end
    @another_entries = Entry.where(room_id: my_room_ids).where.not(user_id: current_user.id).page(params[:page]).per(3)
  end
  
  def create
    @room = Room.create
    @joinCurrentUser = Entry.create(room_id: @room.id, user_id: current_user.id)
    @joinUser = Entry.create(join_room_params)
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @message = Message.new
      @messages = @room.messages
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  
  def join_room_params
    params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id)
  end

end
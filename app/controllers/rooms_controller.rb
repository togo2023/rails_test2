class RoomsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @rooms = @user.rooms
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_introduction, :money, :address, :image_room, :user_id))
    if @room.save
      redirect_to rooms_path ##後からリンク編集
    else
      render "new"
    end
  end

end

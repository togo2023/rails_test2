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
      redirect_to room_path(@room)
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    ensure_correct_user
  end

  def edit
    @room = Room.find(params[:id])
    ensure_correct_user
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:room_name, :room_introduction, :money, :address, :image_room))
      redirect_to room_path(@room.id)
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to :rooms
  end

  private

  def ensure_correct_user
    unless @room.user_id == current_user.id
      redirect_to :rooms
    end
  end

end

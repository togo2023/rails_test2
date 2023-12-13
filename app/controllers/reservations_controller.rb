class ReservationsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @reservations = @user.reservations
  end

  def confirm
    @reservation = Reservation.new(params_reservation)
    @room = Room.find(params[:reservation][:room_id])
    @day = @reservation.day_count 
    @total = (@reservation.check_out - @reservation.check_in).to_i / 86400 * @reservation.people * @room.money
  end

  def create
    @reservation = Reservation.new(params_reservation)
    if @reservation.save
      redirect_to reservations_path
    else
      @room = Room.find(params[:reservation][:room_id])
      render "confirm"
    end
  end

  private

  def params_reservation
    params.require(:reservation).permit(:check_in, :check_out, :people, :user_id, :room_id, :total_money)
  end
end

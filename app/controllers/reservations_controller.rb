class ReservationsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @reservations = @user.reservations
  end

  def confirm
    @reservation = Reservation.new(params_reservation)
    @room = Room.find(params[:reservation][:room_id])
    if @reservation.invalid?
      render "rooms/show"
    else
      calculation
    end
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

  def edit
    @reservation = Reservation.find(params[:id])
    ensure_correct_user
  end

  def edit_confirm 
    @reservation = Reservation.find(params[:id])
    @reservation.attributes = params_reservation
    @room = Room.find(params[:reservation][:room_id])
    ensure_correct_user
    if @reservation.invalid?
      render "edit"
    else
      calculation
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(params_reservation)
      redirect_to reservations_path
    else
      render "edit"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def ensure_correct_user
    unless @reservation.user_id == current_user.id
      redirect_to reservations_path
    end
  end

  def params_reservation
    params.require(:reservation).permit(:check_in, :check_out, :people, :user_id, :room_id, :total_money)
  end

  def calculation
    unless @reservation.check_out.nil? || @reservation.check_in.nil? || @reservation.people.nil? || @room.money.nil?
      @day = (@reservation.check_out - @reservation.check_in).to_i / 86400
      @total = (@reservation.check_out - @reservation.check_in).to_i / 86400 * @reservation.people * @room.money
    end
  end
end
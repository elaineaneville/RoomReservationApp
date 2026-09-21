class ReservationsController < ApplicationController
  before_action :require_authenticated_user
  before_action :set_reservation, only: %i[show destroy]

  def index
    @reservations = current_user.reservations.includes(room: :site).where(
      "reservation_date >= ?", Date.current
    ).order(
      reservation_date: :asc, 
      start_time: :asc
    )
  end

  def show
    authorize_reservation!
  end

  def new 
    @reservation = Reservation.new
    @rooms = Room.includes(:site).all
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)

    if @reservation.room_id.blank?
      @reservation.errors.add(
        :room_id, "must be selected"
      )
      load_rooms
      return render :new, status: :unprocessable_entity
    end
    
    room = Room.find(@reservation.room_id)
    room.with_lock do
      if @reservation.save
        redirect_to @reservation, notice: 'Reservation was successfully created.'
        return
      end
    end
    load_rooms
    render :new, status: :unprocessable_entity
  end

  def destroy
    authorize_reservation!
    @reservation.destroy
    redirect_to reservations_path, notice: 'Reservation was successfully deleted.'
  end

  private

  def load_rooms
    @rooms = Room.includes(:site).all
  end

  def reservation_params
    params.require(:reservation).permit(
      :room_id, 
      :reserver_name, 
      :reservation_date, 
      :start_time, 
      :end_time
    )
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def authorize_reservation!
    return if @reservation.user_id == current_user.id || current_user.admin?

    redirect_to reservations_path, alert: "You can only view your own reservations."
  end

end

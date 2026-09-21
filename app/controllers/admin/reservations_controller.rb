class Admin::ReservationsController < Admin::BaseController
  before_action :set_reservation, only: %i[approve deny]

  def index
    @reservations = Reservation.includes(:user, room: :site).order(
      status: :asc, reservation_date: :asc, start_time: :asc
    )
  end

  def approve
    @reservation.update!(status: :approved)
    redirect_to admin_reservations_path, notice: "Reservation approved."
  end

  def deny
    @reservation.update!(status: :denied)
    redirect_to admin_reservations_path, notice: "Reservation denied."
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
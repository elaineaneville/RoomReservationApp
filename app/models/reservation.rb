class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user, optional: true

  enum :status, { pending: 0, approved: 1, denied: 2 }

  validates :reserver_name, presence: true
  validates :reservation_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :status, presence: true

  validate :end_time_after_start_time
  validate :no_overlapping_reservations

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    if end_time <= start_time
      errors.add(:end_time, "must be after the start time")
    end
  end

  def no_overlapping_reservations
    return if reservation_date.blank? || start_time.blank? || end_time.blank?

    overlapping_reservations = Reservation.where(room_id: room_id, reservation_date: reservation_date, status: %i[pending approved])
                                          .where.not(id: id)
                                          .where("start_time < ? AND end_time > ?", end_time, start_time)

    if overlapping_reservations.exists?
      errors.add(:base, "This reservation overlaps with an existing reservation.")
    end
  end
end

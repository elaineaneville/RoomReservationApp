class User < ApplicationRecord
  has_secure_password
  has_many :reservations, dependent: :restrict_with_error

  enum :role, { staff: 0, admin: 1 }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true

  normalizes :email, with: ->(email) { email.strip.downcase }
end
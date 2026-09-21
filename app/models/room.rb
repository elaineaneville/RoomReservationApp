class Room < ApplicationRecord
  belongs_to :site
  
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :capacity, presence: true
end

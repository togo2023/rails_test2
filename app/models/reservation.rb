class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in, :check_out, :people, presence: true
  validates :people, numericality: { greater_than_or_equal_to: 1 }
end

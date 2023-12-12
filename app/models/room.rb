class Room < ApplicationRecord
  has_one_attached :image_room
  belongs_to :user

  validates :room_name, :room_introduction, :money, :address, presence: true
  validates :money, numericality: { greater_than_or_equal_to: 1 }
end

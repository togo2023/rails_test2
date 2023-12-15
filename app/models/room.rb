class Room < ApplicationRecord
  has_one_attached :image_room
  belongs_to :user
  has_many :reservations

  validates :room_name, :room_introduction, :money, :address, presence: true
  validates :money, numericality: { greater_than_or_equal_to: 1 }

  def self.search(keyword)
    if search
      Room.where('address LIKE(?)', "%#{keyword}%")
    else
      Room.all
    end
  end
end
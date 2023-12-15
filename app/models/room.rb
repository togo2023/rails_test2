class Room < ApplicationRecord
  has_one_attached :image_room
  belongs_to :user
  has_many :reservations

  validates :room_name, :room_introduction, :money, :address, presence: true
  validates :money, numericality: { greater_than_or_equal_to: 1 }

  def self.search(erea,keyword)
    if erea && keyword
      Room.where(['(room_name LIKE(?) OR room_introduction LIKE(?)) AND address LIKE(?)', "%#{keyword}%", "%#{keyword}%", "%#{erea}%"])
    elsif erea && keyword.blank?
      Room.where('address LIKE(?)', "%#{erea}%")
    elsif erea.blank? && keyword
      Room.where(['room_name LIKE(?) OR room_introduction LIKE(?)', "%#{keyword}%", "%#{keyword}%"])
    else
      Room.all
    end
  end
end
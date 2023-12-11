class Room < ApplicationRecord
  belongs_to :user

  has_one_attached :image_room
end

class Room < ApplicationRecord
  has_one_attached :image_room

  belongs_to :user
end

class Reservation < ApplicationRecord
  has_one_attached :image_room
  belongs_to :user
  belongs_to :room

  def day_count
    (self.check_out - self.check_in).to_i / 86400 
  end

end

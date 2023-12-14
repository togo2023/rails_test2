class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  with_options presence: true do
    validates :check_in
    validates :check_out
    validates :people, numericality: { greater_than_or_equal_to: 1 }
  end
  validate :date_before_start
  validate :date_before_finish

  def date_before_start
    return if check_in.blank?
    errors.add(:check_in, "は今日以降のものを選択してください") if check_in < Date.today
  end

  def date_before_finish
    return if check_out.blank? || check_in.blank?
    errors.add(:check_out, "はチェックイン以降のものを選択してください") if check_out < check_in
  end

end

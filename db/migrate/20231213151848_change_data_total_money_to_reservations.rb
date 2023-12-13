class ChangeDataTotalMoneyToReservations < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :total_money, :integer
  end
end

class AddTotalMoneyToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :total_money, :intger
  end
end

class ChangeDateMoneyToRooms < ActiveRecord::Migration[6.1]
  def change
    change_column :rooms, :money, :integer
  end
end

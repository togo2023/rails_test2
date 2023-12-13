class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :room_id
      t.integer :people
      t.datetime :check_in
      t.datetime :check_out

      t.timestamps
    end
  end
end

class AddUserColumnsToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :user_one_id, :integer
    add_column :rooms, :user_two_id, :integer
  end
end

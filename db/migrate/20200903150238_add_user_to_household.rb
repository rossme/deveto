class AddUserToHousehold < ActiveRecord::Migration[6.0]
  def change
    add_reference :households, :user, null: false, foreign_key: true
  end
end

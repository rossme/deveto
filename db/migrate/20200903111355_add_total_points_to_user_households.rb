class AddTotalPointsToUserHouseholds < ActiveRecord::Migration[6.0]
  def change
    add_column :user_households, :total_points, :integer
    add_column :user_households, :vetos_remaining, :integer
    add_column :user_households, :user_turn, :boolean
  end
end

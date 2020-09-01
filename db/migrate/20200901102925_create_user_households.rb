class CreateUserHouseholds < ActiveRecord::Migration[6.0]
  def change
    create_table :user_households do |t|
      t.references :user, null: false, foreign_key: true
      t.references :household, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateHouseholdMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :household_movies do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :household, null: false, foreign_key: true

      t.timestamps
    end
  end
end

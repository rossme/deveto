class CreateHouseholdMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :household_movies do |t|
      t.references :movies, null: false, foreign_key: true
      t.references :households, null: false, foreign_key: true

      t.timestamps
    end
  end
end

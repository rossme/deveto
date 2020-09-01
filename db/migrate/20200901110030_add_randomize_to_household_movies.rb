class AddRandomizeToHouseholdMovies < ActiveRecord::Migration[6.0]
  def change
    add_reference :household_movies, :randomize_option, null: false, foreign_key: true
  end
end

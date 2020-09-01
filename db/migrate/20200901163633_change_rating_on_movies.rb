class ChangeRatingOnMovies < ActiveRecord::Migration[6.0]
  def change
    change_column :movies, :imdb_rating, :float
  end
end

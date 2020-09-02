class ChangeColumnsInMovies < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :imdb_rating, :rating
    rename_column :movies, :streaming_service, :netflixid
    rename_column :movies, :year, :released
    rename_column :movies, :genre, :type
    rename_column :movies, :language, :synopsis
  end
end

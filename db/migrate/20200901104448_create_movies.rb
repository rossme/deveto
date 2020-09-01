class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.decimal :imdb_rating
      t.date :year
      t.string :genre
      t.string :streaming_service
      t.string :language

      t.timestamps
    end
  end
end

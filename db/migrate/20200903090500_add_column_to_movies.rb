class AddColumnToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :image, :string
    add_column :movies, :runtime, :string
  end
end

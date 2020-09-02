class ChangeYearToStringOnMovies < ActiveRecord::Migration[6.0]
  def change
    change_column :movies, :year, :string
  end
end

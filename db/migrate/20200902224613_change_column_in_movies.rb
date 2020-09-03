class ChangeColumnInMovies < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :type, :media
  end
end

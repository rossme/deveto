class CreateRandomizeOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :randomize_options do |t|
      t.string :name
      t.integer :points
      t.string :description

      t.timestamps
    end
  end
end

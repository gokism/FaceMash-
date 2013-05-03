class CreateGirls < ActiveRecord::Migration
  def change
    create_table :girls do |t|
      t.string :name
      t.integer :age
      t.string :img_path
      t.integer :total_matches
      t.integer :matches_won
      t.integer :matches_lost
      t.integer :rating
      t.integer :ranking

      t.timestamps
    end
  end
end

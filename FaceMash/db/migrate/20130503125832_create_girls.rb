class CreateGirls < ActiveRecord::Migration
  def change
    create_table :girls do |t|
      t.string :name
      t.integer :age
      t.string :img_path
      t.integer :total_matches ,:default=>0
      t.integer :matches_won,:default=>0
      t.integer :matches_lost,:default=>0
      t.integer :rating,:default=>1400
      t.integer :ranking

      t.timestamps
    end
  end
end

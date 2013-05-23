class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :girl_one
      t.integer :girl_two
      t.integer :matches,:default=>0
      t.integer :girl_one_won,:default=>0
      t.integer :girl_two_won,:default=>0

      t.timestamps
    end
  end
end

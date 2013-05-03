class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :girl_one
      t.integer :girl_two
      t.integer :matches
      t.integer :girl_one_won
      t.integer :girl_two_won

      t.timestamps
    end
  end
end

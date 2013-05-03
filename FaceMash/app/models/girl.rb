class Girl < ActiveRecord::Base
  attr_accessible :age, :img_path, :matches_lost, :matches_won, :name, :ranking, :rating, :total_matches
end

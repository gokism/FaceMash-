class MatchController < ApplicationController
  def start

  
  
  end
  
  def end_match
    
    girl_won = Girl.find_by_id(params[:girl_won_id])
    girl_lost=Girl.find_by_id(params[:girl_lost_id])
    
    if girl_won.update_attributes(:total_matches=>:total_matches+1,:matches_won=>:matches_won+1) && girl_lost.update_attributes(:total_matches=>:total_matches+1,:matches_lost=>:matches_lost-1)
    
    match= match.where("girl_one=? AND girl_two=?",girl_won.id,girl_lost.id)?match.where("girl_one=? AND girl_two=?",girl_won.id,girl_lost.id):match.where("girl_one=? AND girl_two=?",girl_lost.id,girl_won.id)
    
    if match==nil && match=match.create(:girl_one=>girl_won.id,:girl_two=>girl_lost.id)
     ratings girl_won,girl_lost
    else
      match.update_attribute(:matches=>:matches+1)
    ratings girl_won,girl_lost
    end
    
    else
      ratings girl_won,girl_lost
    end
    
  end
  
  def ratings girl_won,girl_lost
    
    ea=1.0/(1+10**((girl_lost.rating-girl_won.rating)/400.0))
    eb=1.0/(1+10**((girl_won.rating-girl_lost.rating)/400.0))
    
    girl_won_rating=girl_won.rating+32*(1-ea)
    girl_lost_rating=girl_lost.rating+ 32*(0-eb)
    
    if girl_won.update_attribute(:rating=>girl_won_rating) && girl_lost.update_attributes(:rating=>girl_lost_rating)
      redirect_to match_start(:girl_last_won=>girl_won.id)
    end
    
  end
  
end

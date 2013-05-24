class MatchController < ApplicationController
  def start

    @girl_one=Girl.order("rating ASC").first
    @girl_two=Girl.order("rating ASC").second
    @girl_one_won="./end_match?girl_won=#{@girl_one.id}&girl_lost=#{@girl_two.id}"
    @girl_two_won="./end_match?girl_lost=#{@girl_one.id}&girl_won=#{@girl_two.id}"

  end

  def end_match

    girl_won = Girl.find_by_id(params[:girl_won])
    girl_lost = Girl.find_by_id(params[:girl_lost])
    girl_won_total_matches = girl_won.total_matches + 1
    girl_lost_total_mathces=girl_lost.total_matches + 1
    girl_won_matches_won=girl_won.matches_won + 1
    girl_lost_matches_lost=girl_lost.matches_lost + 1

    if girl_won.update_attributes(:total_matches=>girl_won_total_matches,:matches_won=>girl_won_matches_won) && girl_lost.update_attributes(:total_matches=>girl_won_total_matches,:matches_lost=>girl_lost_matches_lost)

      if Match.where("girl_one=? AND girl_two=?",girl_won.id,girl_lost.id).first==nil && Match.where("girl_one=? AND girl_two=?",girl_lost.id,girl_won.id).first==nil
        if(Match.create(:girl_one=>girl_won.id,:girl_two=>girl_lost.id))
          match=Match.where("girl_one=? AND girl_two=?",girl_won.id,girl_lost.id).first
          puts "sdfsd"
        end
      elsif Match.where("girl_one=? AND girl_two=?",girl_won.id,girl_lost.id).first
        puts "1"
        match = Match.where("girl_one=? AND girl_two=?",girl_won.id,girl_lost.id).first
      elsif Match.where("girl_one=? AND girl_two=?",girl_lost.id,girl_won.id).first
        puts "2"
        match = Match.where("girl_one=? AND girl_two=?",girl_lost.id,girl_won.id).first
      end

      matches=match.matches + 1

      match.update_attributes(:matches=>matches)

      ratings(girl_won,girl_lost)

    end

  end

  def ratings girl_won,girl_lost

    ea=1.0/(1 + 10**((girl_lost.rating - girl_won.rating)/400.0))
    eb=1.0/(1 + 10**((girl_won.rating - girl_lost.rating)/400.0))

    girl_won_rating=girl_won.rating+32*(1-ea)
    girl_lost_rating=girl_lost.rating+ 32*(0-eb)

    if girl_won.update_attributes(:rating=>girl_won_rating) && girl_lost.update_attributes(:rating=>girl_lost_rating)
      redirect_to match_start_path
    end

  end
  
  

end

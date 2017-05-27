module BattlelordsHelper

  def display_adj(val)
    if val >=0
      "+#{val}"
    else
      val.to_s
    end
  end

end

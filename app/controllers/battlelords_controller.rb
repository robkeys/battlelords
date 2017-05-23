class BattlelordsController < ApplicationController

  attr_accessor :battlelord

  def show
    @bl = Battlelord.find(params[:id])
  end

  def new
    @bl = Battlelord.new(:race_id => 1)
  end

  def create
    @bl = Battlelord.new(battlelord_params)
    if @bl.save
      @bl.calculate_scores
      redirect_to(battlelord_path(@bl.id))
    else
      render('new')
    end
  end

  private

  def battlelord_params
    params.require(:battlelord).permit(:id, :race_id, :strength_base, :dexterity_base, :iq_base, :agility_base,
                                      :constitution_base, :aggression_base, :intuition_base, :charisma_base )
  end

end

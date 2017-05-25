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
      @bl.create_base_scores
      @bl.save
      redirect_to(battlelord_path(@bl.id))
    else
      render('new')
    end
    logger.info(@bl.errors.inspect)
  end

  private

  def battlelord_params
    params.require(:battlelord).permit(:id, :race_id, :strength, :dexterity, :iq, :agility,
                                      :constitution, :aggression, :intuition, :charisma )
  end

end

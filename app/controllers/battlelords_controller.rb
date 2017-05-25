class BattlelordsController < ApplicationController

  attr_accessor :battlelord

  def index
    @bl = Battlelord.sort_asc

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @bl = Battlelord.find(params[:id])
  end

  def new
    r = [rand(13), rand(45..90), rand(45..90), rand(45..90), rand(45..90), rand(45..90), rand(45..90),
         rand(45..90), rand(45..90)]
    @bl = Battlelord.new({ :race_id => r[0], :name => 'Battlelords Name' , :strength => r[1], :dexterity => r[2],
                         :iq => r[3], :agility => r[4], :constitution => r[5], :aggression => r[6], :intuition => r[7],
                         :charisma => r[8]})
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

  def destroy
    @bl = Battlelord.find(params[:id])
    if @bl.destroy
      redirect_to(battlelords_path)
    else
      render('show')
    end
  end

  private

  def battlelord_params
    params.require(:battlelord).permit(:id, :race_id, :name, :strength, :dexterity, :iq, :agility,
                                      :constitution, :aggression, :intuition, :charisma )
  end

end

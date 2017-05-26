class BattlelordsController < ApplicationController

  attr_accessor :battlelord

  def index
    @bl = Battlelord.sort_asc
  end

  def show
    @bl = Battlelord.find(params[:id])
  end

  def new
    @vs_rolls = [rand(100), rand(100), rand(100), rand(100), rand(100),
                 rand(100), rand(100), rand(100), rand(100), rand(100)].sort { |x, y| y <=> x }
    @bl = Battlelord.new({ :name => 'Battlelords Name'})
    @vs_names = @bl.vs_names


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

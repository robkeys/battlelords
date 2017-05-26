class BattlelordsController < ApplicationController

  attr_accessor :battlelord

  def index
    @bl = Battlelord.sort_asc
  end

  def show
    @bl = Battlelord.find(params[:id])
  end

  def new
    @vs_rolls = generate_rolls
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

  def generate_rolls
    # makes sure at least half of the usable scores are over 50
    continue = true
    while continue
      r = 10.times.collect { rand(100) }.push().sort{ |a,z| z <=> a }
      puts(r)
      r[0..3].each do |val|
        if val <= 49
          continue = true
          break
        end
        continue = false
      end
      unless continue
        return r
      end
    end
  end

end

class BattlelordsController < ApplicationController

  attr_accessor :battlelord

  def index
    @bl = Battlelord.id_sort
  end

  def show
    @bl = Battlelord.find(params[:id])
  end

  def new
    @bl = new_battlelord(:name => 'Battlelords Name')
    @bl.base_ss.terrestrial_knowledge = (rand(100)/3.0).ceil
    @race = Race.id_sort
    @vs_rolls = generate_rolls
  end

  def create
    @bl = new_battlelord(battlelord_params)
    if @bl.save
      redirect_to(battlelord_path(@bl.id))
    else
      render('new')
    end
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
    params.require(:battlelord).permit(:race_id, :name, {
                   base_vs_attributes: [:strength, :dexterity, :iq, :agility, :constitution, :aggression,
                                          :intuition, :charisma],
                   base_ss_attributes: [:terrestrial_knowledge, :military_leadership, :persuasion, :bargaining]})
  end

  def new_battlelord(new_bl_params = [])
    bl = Battlelord.new(new_bl_params)
    bl.base_vs ||= VitalStat.new(:is_base => true)
    bl.base_ds ||= DerivedStat.new(:is_base => true)
    bl.base_ss ||= SecondaryStat.new(:is_base => true)
    bl.base_smr ||= SmrScore.new(:is_base => true)
    bl
  end

  def generate_rolls
    # makes sure at least half of the usable scores are over 50
    continue = true
    while continue
      r = 10.times.collect { rand(100) }.push.sort{ |a,z| z <=> a }
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

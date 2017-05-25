class Battlelord < ApplicationRecord

  belongs_to :race
  belongs_to :base_vs, :class_name => 'VitalStat', :foreign_key => :base_vs_id, :optional => true
  belongs_to :base_ds, :class_name => 'DerivedStat', :foreign_key => :base_ds_id, :optional => true
  belongs_to :base_ss, :class_name => 'SecondaryStat', :foreign_key => :base_ss_id, :optional => true
  belongs_to :base_smr, :class_name => 'SmrScore', :foreign_key => :base_smr_id, :optional => true
  has_many :vital_stats
  has_many :derived_stats
  has_many :secondary_stats
  has_many :smr_scores

  def vs_names
    %w(strength dexterity iq agility constitution aggression intuition charisma)
  end
  
  def vs_base_scores
    [self.base_vs.strength, self.base_vs.dexterity, self.base_vs.iq, self.base_vs.agility, self.base_vs.constitution, 
     self.base_vs.aggression, self.base_vs.intuition, self.base_vs.charisma]
  end
  
  def vs_scores
    [self.strength, self.dexterity, self.iq, self.agility, self.constitution, self.aggression, self.intuition,
     self.charisma]
  end

  def vs_race_adj
    [self.race.strength, self.race.dexterity, self.race.iq, self.race.agility, self.race.constitution,
     self.race.aggression, self.race.intuition, self.race.charisma]
  end

  def create_base_scores
    vs = VitalStat.create!(:battlelord_id => self.id, :is_base => true )
    ds = DerivedStat.create!(:battlelord_id => self.id, :is_base => true )
    ss = SecondaryStat.create!(:battlelord_id => self.id, :is_base => true )
    smr = SmrScore.create!(:battlelord_id => self.id, :is_base => true )
    self.attributes = { :base_vs_id => vs.id, :base_ds_id => ds.id, :base_ss_id => ss.id, :base_smr_id => smr.id }
    self.create_scores
    self.calculate_scores
  end

  def create_scores
    self.vs_names.each do |vs|
      eval("self.base_vs.update :#{vs} => self.#{vs}")
      puts eval("self.#{vs}")
      puts eval("self.base_vs.#{vs}")
    end
  end

  def calculate_scores
    self.vs_names.each do |vs|
      eval("self.#{vs} = self.base_vs.#{vs} + self.race.#{vs}")
      eval("calculate_#{vs}_scores")
    end
  end

  def calculate_strength_scores
    ss_table = VitalStatsTableStrength.where('value_min<=? AND value_max>=?', self.strength, self.strength).first
    self.base_ds.update :encumbrance_light => ss_table.encumbrance_light
    self.base_ds.update :encumbrance_medium => ss_table.encumbrance_medium
    self.base_ds.update :encumbrance_severe => ss_table.encumbrance_severe
    self.base_ds.update :damage_adjustment => ss_table.damage_adjustment
    self.base_ds.update :skill_bonus_strength => ss_table.skill_bonus
    self.base_ds.update :military_press => ss_table.military_press
    self.base_ds.update :squat => ss_table.squat
    self.base_ds.update :dead_lift => ss_table.dead_lift
  end
  
  def calculate_dexterity_scores
    ss_table = VitalStatsTableDexterity.where('value_min<=? AND value_max>=?', self.dexterity, self.dexterity).first
    self.base_ds.update :ranged_attack_bonus => ss_table.ranged_attack_bonus
    self.base_ds.update :skill_bonus_dexterity => ss_table.skill_bonus
  end

  def calculate_iq_scores
    ss_table = VitalStatsTableIq.where('value_min<=? AND value_max>=?', self.iq, self.iq).first
    self.base_ds.update :power_points => ss_table.power_points
    self.base_ds.update :languages => ss_table.languages
    self.base_ds.update :skill_bonus_iq => ss_table.skill_bonus
  end

  def calculate_agility_scores
    ss_table = VitalStatsTableAgility.where('value_min<=? AND value_max>=?', self.agility, self.agility).first
    self.base_ds.update :initiative_modifier => ss_table.initiative_modifier
    self.base_ds.update :defensive_modifier => ss_table.defensive_modifier
    self.base_ds.update :melee_attack_bonus => ss_table.melee_attack_bonus
    self.base_ds.update :skill_bonus_agility => ss_table.skill_bonus
  end

  def calculate_constitution_scores
    con = self.constitution # var to save space on next line
    ss_table = VitalStatsTableConstitution.where('value_min<=? AND value_max>=?', con, con).first
    self.base_ds.update :system_shock => ss_table.system_shock
    self.base_ds.update :resurrection_percentage => ss_table.resurrection_percentage
    self.base_ds.update :deaths_door => ss_table.deaths_door
    self.base_ds.update :body_points => ss_table.body_points
    self.base_ds.update :physical_bonus => ss_table.physical_bonus
  end

  def calculate_aggression_scores
    self.base_ds.update :rage_chance => self.aggression >= 80 ? self.aggression - 80 : 0
    self.base_ds.update :suicidal_chance => self.aggression >= 105 ? self.aggression - 105 : 0
    self.base_ds.update :panic_chance => self.aggression <= 35 ? 35 - self.aggression : 0
  end

  def calculate_intuition_scores
    ss_table = VitalStatsTableIntuition.where('value_min<=? AND value_max>=?', self.intuition, self.intuition).first
    self.base_ds.update :mental_bonus => ss_table.survival_matrix_adjust
  end

  def calculate_charisma_scores
    ss_table = VitalStatsTableCharisma.where('value_min<=? AND value_max>=?', self.charisma, self.charisma).first
    self.base_ds.update :reaction_modifier => ss_table.reaction_modifier
    self.base_ds.update :loyalty_base => ss_table.loyalty_base
  end

end

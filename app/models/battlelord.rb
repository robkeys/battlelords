class Battlelord < ApplicationRecord

  belongs_to :race
  
  def vs_base_scores
    [self.strength_base, self.dexterity_base, self.iq_base, self.agility_base, self.constitution_base, 
     self.aggression_base, self.intuition_base, self.charisma_base]
  end
  
  def vs_scores
    [self.strength, self.dexterity, self.iq, self.agility, self.constitution, self.aggression, self.intuition,
     self.charisma]
  end

  def vs_race_adj
    [self.race.strength, self.race.dexterity, self.race.iq, self.race.agility, self.race.constitution,
     self.race.aggression, self.race.intuition, self.race.charisma]
  end

  def vs_names
    %w(strength dexterity iq agility constitution aggression intuition charisma)
  end

  def calculate_scores
    self.vs_names.each do |vs|
      eval("self.#{vs} = self.#{vs}_base + self.race.#{vs}")
      eval("calculate_#{vs}_scores")
    end
    self.save
  end

  def calculate_strength_scores
    ss_table = VitalStatsTableStrength.where('value_min<=? AND value_max>=?', self.strength, self.strength).first
    self.encumbrance_light = ss_table.encumbrance_light
    self.encumbrance_medium = ss_table.encumbrance_medium
    self.encumbrance_severe = ss_table.encumbrance_severe
    self.damage_adjustment = ss_table.damage_adjustment
    self.skill_bonus_strength = ss_table.skill_bonus
    self.military_press = ss_table.military_press
    self.squat = ss_table.squat
    self.dead_lift = ss_table.dead_lift
  end
  
  def calculate_dexterity_scores
    ss_table = VitalStatsTableDexterity.where('value_min<=? AND value_max>=?', self.dexterity, self.dexterity).first
    self.ranged_attack_bonus = ss_table.ranged_attack_bonus
    self.skill_bonus_dexterity = ss_table.skill_bonus
  end

  def calculate_iq_scores
    ss_table = VitalStatsTableIq.where('value_min<=? AND value_max>=?', self.iq, self.iq).first
    self.power_points = ss_table.power_points
    self.languages = ss_table.languages
    self.skill_bonus_iq = ss_table.skill_bonus
  end

  def calculate_agility_scores
    ss_table = VitalStatsTableAgility.where('value_min<=? AND value_max>=?', self.agility, self.agility).first
    self.initiative_modifier = ss_table.initiative_modifier
    self.defensive_modifier = ss_table.defensive_modifier
    self.melee_attack_bonus = ss_table.melee_attack_bonus
    self.skill_bonus_agility = ss_table.skill_bonus
  end

  def calculate_constitution_scores
    con = self.constitution # var to save space on next line
    ss_table = VitalStatsTableConstitution.where('value_min<=? AND value_max>=?', con, con).first
    self.system_shock = ss_table.system_shock
    self.resurrection_percentage = ss_table.resurrection_percentage
    self.deaths_door = ss_table.deaths_door
    self.body_points = ss_table.body_points
    self.physical_bonus = ss_table.physical_bonus
  end

  def calculate_aggression_scores
    self.rage_chance = self.aggression >= 80 ? self.aggression - 80 : 0
    self.suicidal_chance = self.aggression >= 105 ? self.aggression - 105 : 0
    self.panic_chance = self.aggression <= 35 ? 35 - self.aggression : 0
  end

  def calculate_intuition_scores
    ss_table = VitalStatsTableIntuition.where('value_min<=? AND value_max>=?', self.intuition, self.intuition).first
    self.mental_bonus = ss_table.survival_matrix_adjust
  end

  def calculate_charisma_scores
    ss_table = VitalStatsTableCharisma.where('value_min<=? AND value_max>=?', self.charisma, self.charisma).first
    self.reaction_modifier = ss_table.reaction_modifier
    self.loyalty_base = ss_table.loyalty_base
  end

end

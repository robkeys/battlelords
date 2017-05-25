class DerivedStat < ApplicationRecord

  def calculate_derived_stats(score_list)
    calculate_strength_scores(score_list[0])
    calculate_dexterity_scores(score_list[1])
    calculate_iq_scores(score_list[2])
    calculate_agility_scores(score_list[3])
    calculate_constitution_scores(score_list[4])
    calculate_aggression_scores(score_list[5])
    calculate_intuition_scores(score_list[6])
    calculate_charisma_scores(score_list[7])
    self.save
  end

  def calculate_strength_scores(score)
    ss_table = VitalStatsTableStrength.where('value_min<=? AND value_max>=?', score, score).first
    self.encumbrance_light = ss_table.encumbrance_light
    self.encumbrance_medium = ss_table.encumbrance_medium
    self.encumbrance_severe = ss_table.encumbrance_severe
    self.damage_adjustment = ss_table.damage_adjustment
    self.skill_bonus_strength = ss_table.skill_bonus
    self.military_press = ss_table.military_press
    self.squat = ss_table.squat
    self.dead_lift = ss_table.dead_lift
  end

  def calculate_dexterity_scores(score)
    ss_table = VitalStatsTableDexterity.where('value_min<=? AND value_max>=?', score, score).first
    self.ranged_attack_bonus = ss_table.ranged_attack_bonus
    self.skill_bonus_dexterity = ss_table.skill_bonus
  end

  def calculate_iq_scores(score)
    ss_table = VitalStatsTableIq.where('value_min<=? AND value_max>=?', score, score).first
    self.power_points = ss_table.power_points
    self.languages = ss_table.languages
    self.skill_bonus_iq = ss_table.skill_bonus
  end

  def calculate_agility_scores(score)
    ss_table = VitalStatsTableAgility.where('value_min<=? AND value_max>=?', score, score).first
    self.initiative_modifier = ss_table.initiative_modifier
    self.defensive_modifier = ss_table.defensive_modifier
    self.melee_attack_bonus = ss_table.melee_attack_bonus
    self.skill_bonus_agility = ss_table.skill_bonus
  end

  def calculate_constitution_scores(score)
    ss_table = VitalStatsTableConstitution.where('value_min<=? AND value_max>=?', score, score).first
    self.system_shock = ss_table.system_shock
    self.resurrection_percentage = ss_table.resurrection_percentage
    self.deaths_door = ss_table.deaths_door
    self.body_points = ss_table.body_points
    self.physical_bonus = ss_table.physical_bonus
  end

  def calculate_aggression_scores(score)
    self.rage_chance = score >= 80 ? score - 80 : 0
    self.suicidal_chance = score >= 105 ? score - 105 : 0
    self.panic_chance = score <= 35 ? 35 - score : 0
  end

  def calculate_intuition_scores(score)
    ss_table = VitalStatsTableIntuition.where('value_min<=? AND value_max>=?', score, score).first
    self.mental_bonus = ss_table.survival_matrix_adjust
  end

  def calculate_charisma_scores(score)
    ss_table = VitalStatsTableCharisma.where('value_min<=? AND value_max>=?', score, score).first
    self.reaction_modifier = ss_table.reaction_modifier
    self.loyalty_base = ss_table.loyalty_base
  end

end

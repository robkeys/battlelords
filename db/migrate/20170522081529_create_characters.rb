class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.integer :race_id

      t.integer :strength
      t.integer :dexterity
      t.integer :iq
      t.integer :agility
      t.integer :constitution
      t.integer :aggression
      t.integer :intuition
      t.integer :charisma

      t.integer :encumbrance
      t.integer :encumbrance_light
      t.integer :encumbrance_medium
      t.integer :encumbrance_severe
      t.integer :damage_adjustment
      t.integer :military_press
      t.integer :squat
      t.integer :dead_lift
      t.integer :ranged_attack_bonus
      t.integer :power_points
      t.integer :languages
      t.integer :initiative_modifier
      t.integer :defensive_modifier
      t.integer :melee_attack_bonus
      t.integer :system_shock
      t.integer :resurrection_percentage
      t.integer :deaths_door
      t.integer :body_points
      t.integer :physical_bonus # Survival Matrix Roll Adjustment
      t.integer :rage_chance
      t.integer :suicidal_chance
      t.integer :panic_chance
      t.integer :mental_bonus
      t.integer :reaction_modifier
      t.integer :loyalty_base

      t.integer :skill_bonus_strength
      t.integer :skill_bonus_dexterity
      t.integer :skill_bonus_iq
      t.integer :skill_bonus_agility
      t.integer :skill_bonus_constitution
      t.integer :skill_bonus_aggression
      t.integer :skill_bonus_intuition
      t.integer :skill_bonus_charisma

      t.timestamps
    end
  end
end

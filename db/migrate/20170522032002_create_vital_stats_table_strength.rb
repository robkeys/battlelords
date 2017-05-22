class CreateVitalStatsTableStrength < ActiveRecord::Migration[5.0]
  def change
    create_table :vital_stats_table_strength do |t|
      t.integer :value_min
      t.integer :value_max
      t.integer :encumbrance_light
      t.integer :encumbrance_medium
      t.integer :encumbrance_severe
      t.integer :damage_adjustment
      t.integer :skill_bonus
      t.integer :military_press
      t.integer :squat
      t.integer :dead_lift
      t.string :flavor_text
    end
  end
end

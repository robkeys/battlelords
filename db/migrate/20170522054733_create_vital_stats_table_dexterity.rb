class CreateVitalStatsTableDexterity < ActiveRecord::Migration[5.0]
  def change
    create_table :vital_stats_table_dexterity do |t|
      t.integer :value_min
      t.integer :value_max
      t.integer :ranged_attack_bonus
      t.integer :skill_bonus
      t.string  :flavor_text
    end
  end
end

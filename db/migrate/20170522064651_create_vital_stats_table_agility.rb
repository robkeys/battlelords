class CreateVitalStatsTableAgility < ActiveRecord::Migration[5.0]
  def change
    create_table :vital_stats_table_agility do |t|
      t.integer :value_min
      t.integer :value_max
      t.integer :initiative_modifier
      t.integer :defensive_modifier
      t.integer :skill_bonus
      t.integer :melee_attack_bonus
      t.string :flavor_text
    end
  end
end

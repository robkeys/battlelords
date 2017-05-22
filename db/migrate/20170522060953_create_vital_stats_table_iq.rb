class CreateVitalStatsTableIq < ActiveRecord::Migration[5.0]
  def change
    create_table :vital_stats_table_iq do |t|
      t.integer :value_min
      t.integer :value_max
      t.integer :power_points
      t.integer :languages
      t.integer :skill_bonus
      t.string :flavor_text
    end
  end
end

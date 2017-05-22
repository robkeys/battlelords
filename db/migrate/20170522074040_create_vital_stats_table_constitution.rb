class CreateVitalStatsTableConstitution < ActiveRecord::Migration[5.0]
  def change
    create_table :vital_stats_table_constitution do |t|
      t.integer :value_min
      t.integer :value_max
      t.integer :system_shock
      t.integer :resurrection_percentage
      t.integer :deaths_door
      t.integer :body_points
      t.integer :physical_bonus
      t.string :flavor_text
    end
  end
end

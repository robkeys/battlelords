class CreateVitalStatsTableCharisma < ActiveRecord::Migration[5.0]
  def change
    create_table :vital_stats_table_charisma do |t|
      t.integer :value_min
      t.integer :value_max
      t.integer :reaction_modifier
      t.integer :loyalty_base
      t.string :flavor_text
    end
  end
end

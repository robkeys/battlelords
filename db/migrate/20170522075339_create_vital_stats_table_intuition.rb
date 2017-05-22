class CreateVitalStatsTableIntuition < ActiveRecord::Migration[5.0]
  def change
    create_table :vital_stats_table_intuition do |t|
      t.integer :value_min
      t.integer :value_max
      t.integer :survival_matrix_adjust
      t.string :flavor_text
    end
  end
end

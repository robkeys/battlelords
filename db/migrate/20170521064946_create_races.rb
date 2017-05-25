class CreateRaces < ActiveRecord::Migration[5.0]
  def change
    create_table :races do |t|

      t.integer :vital_stat_id
      t.integer :secondary_stat_id
      t.integer :smr_score_id

      t.string :name

      t.integer :strength_min
      t.integer :strength_max
      t.integer :iq_min
      t.integer :iq_max
      t.integer :constitution_min
      t.integer :constitution_max
      t.integer :agility_min
      t.integer :agility_max

      t.integer :body_points_base
      t.string :body_points_dice
      t.integer :height_base
      t.string :height_dice
      t.integer :weight_base
      t.string :weight_dice
      t.integer :movement_mps
      t.integer :movement_kmph
      t.integer :movement_kmpd
      t.integer :vision
      t.integer :hearing
      t.integer :smell
      t.integer :starting_money_multiplier
      t.string :starting_money_dice
      t.integer :proficiency_points
      t.string :home_planet
      t.string :primary_occupation

      t.timestamps
    end
  end
end

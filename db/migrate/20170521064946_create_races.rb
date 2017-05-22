class CreateRaces < ActiveRecord::Migration[5.0]
  def change
    create_table :races do |t|
      t.string :name

      t.integer :strength
      t.integer :strength_min
      t.integer :strength_max
      t.integer :iq
      t.integer :iq_min
      t.integer :iq_max
      t.integer :constitution
      t.integer :constitution_min
      t.integer :constitution_max
      t.integer :intuition
      t.integer :dexterity
      t.integer :agility
      t.integer :agility_min
      t.integer :agility_max
      t.integer :aggression
      t.integer :charisma

      t.integer :terrestrial_knowlege
      t.integer :persuasion
      t.integer :military_leadership
      t.integer :barganing

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

      t.integer :chemical
      t.integer :biological
      t.integer :poison
      t.integer :electricity
      t.integer :acid
      t.integer :radiation
      t.integer :mental
      t.integer :sonic
      t.integer :fire
      t.integer :cold

      t.timestamps
    end
  end
end

class CreateSecondaryStats < ActiveRecord::Migration[5.0]

  # see vital stats migration for notes on my thinking here.

  def change
    create_table :secondary_stats do |t|

      t.integer :battlelord_id
      t.integer :race_id

      t.integer :terrestrial_knowledge
      t.integer :persuasion
      t.integer :military_leadership
      t.integer :bargaining

      t.boolean :is_base

      t.timestamps
    end
  end
end

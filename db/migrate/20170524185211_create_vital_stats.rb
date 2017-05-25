class CreateVitalStats < ActiveRecord::Migration[5.0]

  # Migration model for stat adjustments.
  # When a new source of stat adjustments is needed
  # just add a new foreign key field and boolean. Then
  # duplicate the record and add a battlelord_id.

  def change
    create_table :vital_stats do |t|

      t.integer :battlelord_id, :optional => true
      t.integer :race_id, :optional => true

      t.integer :strength
      t.integer :dexterity
      t.integer :iq
      t.integer :agility
      t.integer :constitution
      t.integer :aggression
      t.integer :intuition
      t.integer :charisma

      t.boolean :is_base

      t.string :description

      t.timestamps
    end
  end
end

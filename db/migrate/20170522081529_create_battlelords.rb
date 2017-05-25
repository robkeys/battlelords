class CreateBattlelords < ActiveRecord::Migration[5.0]
  def change
    create_table :battlelords do |t|

      t.integer :race_id
      t.integer :base_vs_id
      t.integer :base_ds_id
      t.integer :base_ss_id
      t.integer :base_smr_id

      t.string :name

      t.integer :strength
      t.integer :dexterity
      t.integer :iq
      t.integer :agility
      t.integer :constitution
      t.integer :aggression
      t.integer :intuition
      t.integer :charisma

      t.timestamps
    end
    add_index :battlelords, :race_id
  end
end

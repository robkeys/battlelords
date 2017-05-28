class CreateBattlelords < ActiveRecord::Migration[5.0]
  def change
    create_table :battlelords do |t|

      t.integer :race_id
      t.integer :base_vs_id
      t.integer :base_ds_id
      t.integer :base_ss_id
      t.integer :base_smr_id

      t.string :name
      t.string :gender

      t.timestamps
    end
    add_index :battlelords, :race_id
  end
end

class CreateSmrScores < ActiveRecord::Migration[5.0]
  def change
    create_table :smr_scores do |t|

      t.integer :battlelord_id

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

      t.boolean :is_base

      t.timestamps
    end
  end
end

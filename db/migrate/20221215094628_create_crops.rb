class CreateCrops < ActiveRecord::Migration[7.0]
  def change
    create_table :crops do |t|
      t.integer :quantity
      t.references :veggie, null: false, foreign_key: true
      t.references :bed, null: false, foreign_key: true

      t.timestamps
    end
  end
end

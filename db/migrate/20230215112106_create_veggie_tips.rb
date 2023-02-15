class CreateVeggieTips < ActiveRecord::Migration[7.0]
  def change
    create_table :veggie_tips do |t|
      t.string :tip
      t.references :veggie, null: false, foreign_key: true

      t.timestamps
    end
  end
end

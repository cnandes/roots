class CreateBeds < ActiveRecord::Migration[7.0]
  def change
    create_table :beds do |t|
      t.string :description
      t.integer :length
      t.integer :width
      t.references :garden, null: false, foreign_key: true

      t.timestamps
    end
  end
end

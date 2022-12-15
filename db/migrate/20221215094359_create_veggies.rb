class CreateVeggies < ActiveRecord::Migration[7.0]
  def change
    create_table :veggies do |t|
      t.string :name

      t.timestamps
    end
  end
end

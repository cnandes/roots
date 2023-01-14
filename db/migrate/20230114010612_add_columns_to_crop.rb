class AddColumnsToCrop < ActiveRecord::Migration[7.0]
  def change
    add_column :crops, :plant_date, :date
    add_column :crops, :planted, :boolean
    add_column :crops, :season, :string
  end
end

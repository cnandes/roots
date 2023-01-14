class AddColumnsToCrops < ActiveRecord::Migration[7.0]
  def change
    add_column :crops, :weeks_to_harvest, :integer
    add_column :crops, :emoji, :string
    add_column :crops, :comment, :text
  end
end

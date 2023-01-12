class AddColumnsToCrops < ActiveRecord::Migration[7.0]
  def change
    add_column :crops, :duration, :integer
    add_column :crops, :emoji, :string
    add_column :crops, :comment, :text
  end
end
